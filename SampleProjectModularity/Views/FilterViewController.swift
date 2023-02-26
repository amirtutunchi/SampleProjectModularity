import UIKit

class FilterViewController: UIViewController {
    
    @IBAction func filterButton_Tapped(_ sender: Any) {
        searchParameters.filteredText = filterTextbox.text
        onFilterButtonTap(searchParameters)
        self.dismiss(animated: true)
    }
    
    @IBOutlet weak var filterTextbox: UITextField!
    @IBOutlet weak var filterButton: UIButton!
    
    var onFilterButtonTap: (SearchParametersModel) -> Void
    var searchParameters: SearchParametersModel
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init?(
        coder: NSCoder,
        searchParameters: SearchParametersModel,
        onFilterTap: @escaping (SearchParametersModel) -> Void
    ) {
        self.onFilterButtonTap = onFilterTap
        self.searchParameters = searchParameters
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let filteredText = searchParameters.filteredText {
            filterTextbox.text = filteredText
        }
    }
}
