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
