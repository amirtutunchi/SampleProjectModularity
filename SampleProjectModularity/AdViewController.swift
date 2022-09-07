//
//  ViewController.swift
//  SampleProjectModularity
//
//  Created by AmirHossein BaradaranTutunchi on 02/09/2022.
//

import UIKit
import Kingfisher

class AdViewController: UIViewController {
    var ads = [SearchAdModel]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
    }
    func setupUI() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    func loadData() {
        ads = loadAds()
        tableView.reloadData()
    }
    func presentInAppBrowser(_ url: URL) {
        /// just to demonstrate the problem
    }
    
    // MARK: - Ad Generator
    private func loadAds() -> [SearchAdModel] {
        let sellerWithoutWebsite = Seller(name: "Ali", website: nil)
        let seller = Seller(name: "Jack", website: "https://www.google.com")
        let price = Price(priceAmount: 1000, priceString: "1000 $")
        let ad1 = AdModel(
            id: UUID().uuidString,
            name: "Car", price: price,
            seller: sellerWithoutWebsite,
            image: "https://picsum.photos/200"
        ).toSearchAdModel()
        let ad2 = AdModel(
            id: UUID().uuidString,
            name: "Cat",
            price: price,
            seller: seller,
            image: "https://picsum.photos/200"
        ).toSearchAdModel()
        let ad3 = AdModel(
            id: UUID().uuidString,
            name: "Umbrella",
            price: price,
            seller: sellerWithoutWebsite,
            image: "https://picsum.photos/200"
        ).toSearchAdModel()
        let ad4 = AdModel(
            id: UUID().uuidString,
            name: "Microphone",
            price: price,
            seller: seller,
            image: nil
        ).toSearchAdModel()
        let ad5 = AdModel(
            id: UUID().uuidString,
            name: "Guitar",
            price: price,
            seller: sellerWithoutWebsite,
            image: "https://picsum.photos/200"
        ).toSearchAdModel()
        let ad6 = AdModel(
            id: UUID().uuidString,
            name: "Piano",
            price: price,
            seller: seller,
            image: "https://picsum.photos/200"
        ).toSearchAdModel()
        return [ad1, ad2, ad3, ad4, ad5, ad6]
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
        cell.viewModel = AdViewModel(searchAd: ads[indexPath.row])
        return cell
    }
}

extension AdViewController: AdFeatures {
    func openWebsite(ad: AdModel) {
        if let website = ad.seller.website, let url = URL(string: website) {
            presentInAppBrowser(url)
        }
    }
    
    func openSellerProfile(ad: AdModel) {
        let sellerController = SellerViewController()
        sellerController.seller = ad.seller
        self.present(sellerController, animated: true)
    }
}
