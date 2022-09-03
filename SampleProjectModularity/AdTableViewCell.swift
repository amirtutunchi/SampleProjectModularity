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
    
}
