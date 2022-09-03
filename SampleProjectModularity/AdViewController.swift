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
    }
    
    func presentInAppBrowser(_ url: URL) {
        /// just to demonstrate the problem
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
