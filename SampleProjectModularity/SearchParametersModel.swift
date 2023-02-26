import Foundation

public final class SearchParametersModel: NSObject {
    var selectedAd: AdModel?
    
    override public init() {
        super.init()
    }
    
    public init(searchParameters: SearchParametersModel) {
        self.selectedAd = searchParameters.selectedAd
    }
}
