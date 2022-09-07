//
//  SellerViewController.swift
//  SampleProjectModularity
//
//  Created by AmirHossein BaradaranTutunchi on 03/09/2022.
//

import UIKit

class SellerViewController: UIViewController {
    
    @IBOutlet weak var sellerWebsiteLabel: UILabel!
    @IBOutlet weak var sellerNameLabel: UILabel!
    
    var seller: Seller?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        guard let seller = seller else {
            return
        }
        sellerNameLabel.text = seller.name
        sellerWebsiteLabel.text = seller.website
    }
    
}
