//
//  AdTableViewCell.swift
//  SampleProjectModularity
//
//  Created by AmirHossein BaradaranTutunchi on 03/09/2022.
//

import UIKit
import Kingfisher

class AdTableViewCell: UITableViewCell {
    
    @IBOutlet weak var adImage: UIImageView!
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var priceText: UILabel!
    @IBOutlet weak var sellerNameText: UILabel!
    @IBOutlet weak var websiteText: UILabel!
    
    var adFeaturesDelegate: AdFeatures?
    var searchAd: SearchAdModel? {
        didSet {
            guard let searchAd = searchAd else {
                return
            }
            viewModel = AdViewModel(searchAd: searchAd)
        }
    }
    var viewModel: AdViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                return
            }
            nameText.text = viewModel.name
            priceText.text = viewModel.price
            sellerNameText.text = viewModel.sellerName
            if let imageURL = viewModel.image {
                adImage.kf.setImage(with: imageURL)
            }
            if let url = viewModel.website {
                websiteText.text = url.absoluteString
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        websiteText.isUserInteractionEnabled = true
        sellerNameText.isUserInteractionEnabled = true
        
        let tappedOnWebsite = UITapGestureRecognizer(target: self, action: (#selector(openWebsite)))
        websiteText.addGestureRecognizer(tappedOnWebsite)
        
        let tappedOnSeller = UITapGestureRecognizer(target: self, action: (#selector(openSellerProfile)))
        sellerNameText.addGestureRecognizer(tappedOnSeller)
    }
    
    @objc func openWebsite() {
        guard let ad = searchAd?.ad else {
            return
        }
        adFeaturesDelegate?.openWebsite(ad: ad)
    }
    
    @objc func openSellerProfile() {
        guard let ad = searchAd?.ad else {
            return
        }
        adFeaturesDelegate?.openSellerProfile(ad: ad)
    }
}
