import UIKit
import Kingfisher

class AdViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var carsOnlyButton: UIButton!
    @IBOutlet weak var numberOfFiltersLabel: UILabel!
    
    @IBAction func carsOnlyButton_Tapped(_ sender: UIButton) {
        carsOnlyFilter.toggle()
        if carsOnlyFilter {
            carsOnlyButton.tintColor = .green
        } else {
            carsOnlyButton.tintColor = .red
        }
        loadAds(filteredText: searchParameters.filteredText)
        calculateCountOfFilters()
    }
    @IBAction func filterButton_Tapped(_ sender: UIButton) {
        let filterViewController = UIStoryboard(
            name: "Main",
            bundle: .main
        ).instantiateViewController(identifier: "FilterViewController") { [weak self] coder in
            guard let self = self else { fatalError("something bad happened") }
            return FilterViewController(
                coder: coder,
                searchParameters: self.searchParameters,
                onFilterTap: self.onFilterChanged
            )
        }
        
        self.present(filterViewController, animated: true)
    }
    
    var ads = [SearchAdModel]() {
        didSet {
            tableView.reloadData()
        }
    }
    var searchParameters = SearchParametersModel()
    var carsOnlyFilter: Bool = false
    var filteredText: String? {
        didSet {
            searchParameters.filteredText = filteredText
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init?(coder: NSCoder, filteredText: String?) {
        self.filteredText = filteredText
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadAds()
        calculateCountOfFilters()
        GAnalytic.sharedInstance.customDimensions = ["loading"]
        GAnalytic.sharedInstance.sendEvent(eventName: "PageLoaded")
    }
    
    func setupUI() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func presentInAppBrowser(_ url: URL) {
        UIApplication.shared.open(url)
    }
    
    func onFilterChanged(_ searchParameters: SearchParametersModel) {
        GAnalytic.sharedInstance.customDimensions = ["loading", "filter"]
        GAnalytic.sharedInstance.sendEvent(eventName: "FilterChanged")
        self.searchParameters = searchParameters
        if let filteredText = searchParameters.filteredText {
            loadAds(filteredText: filteredText)
            filterButton.setTitle("Filter is \(filteredText)", for: .normal)
        } else {
            loadAds()
            filterButton.setTitle("Filter", for: .normal)
        }
        tableView.reloadData()
        calculateCountOfFilters()
    }
    
    func calculateCountOfFilters() {
        var count = 0
        if carsOnlyFilter {
            count += 1
        }
        if searchParameters.filteredText != nil {
            count += 1
        }
        numberOfFiltersLabel.text = "\(count) filters"
    }
    // MARK: - Ad Network Calls
    private func loadAds(filteredText: String? = nil) {
        NetworkClient.sharedInstance.getAds { [weak self]  ads in
            let filteredAds = ads.compactMap { item in
                if carsOnlyFilter {
                    if item.ad.name.lowercased().contains("car") {
                        if let filteredText = filteredText  {
                            if item.ad.name.lowercased().contains(filteredText.lowercased()) {
                                return item
                            } else {
                                return nil
                            }
                        } else {
                            return item
                        }
                    } else {
                        return nil
                    }
                } else {
                    if let filteredText = filteredText  {
                        if item.ad.name.lowercased().contains(filteredText.lowercased()) {
                            return item
                        } else {
                            return nil
                        }
                    } else {
                        return item
                    }
                }
            }
            self?.ads = filteredAds
        }
    }
}

extension AdViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ads.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? AdTableViewCell else {
            fatalError("Can not dequeue cell")
        }
        cell.adFeaturesDelegate = self
        cell.searchAd = ads[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension AdViewController: AdSellersDelegate {
    func openWebsite(ad: AdModel) {
        if let website = ad.seller.website, let url = URL(string: website) {
            presentInAppBrowser(url)
        }
    }
    
    func openSellerProfile(ad: AdModel) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sellerController = storyboard.instantiateViewController(withIdentifier: "SellerController") as! SellerViewController
        sellerController.seller = ad.seller
        self.present(sellerController, animated: true)
    }
}
