import UIKit

class FilterViewController: UIViewController {
    
    @IBAction func filterButton_Tapped(_ sender: Any) {
        onFilterButtonTap(filterTextbox.text ?? "")
        self.dismiss(animated: true)
    }
    
    @IBOutlet weak var filterTextbox: UITextField!
    @IBOutlet weak var filterButton: UIButton!
    
    var onFilterButtonTap: (String) -> Void
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init?(coder: NSCoder, onFilterTap: @escaping (String) -> Void) {
        self.onFilterButtonTap = onFilterTap
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
