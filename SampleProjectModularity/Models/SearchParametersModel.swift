import Foundation

public final class SearchParametersModel: NSObject {
    var selectedAd: AdModel?
    var filteredText: String?
    override public init() {
        super.init()
    }
    
    public init(searchParameters: SearchParametersModel) {
        self.selectedAd = searchParameters.selectedAd
        self.filteredText = searchParameters.filteredText
    }
}
