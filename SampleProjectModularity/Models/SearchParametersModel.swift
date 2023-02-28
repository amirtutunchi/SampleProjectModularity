import Foundation

public final class SearchParametersModel: NSObject {
    var filteredText: String?
    
    override public init() {
        super.init()
    }
    
    public init(searchParameters: SearchParametersModel) {
        self.filteredText = searchParameters.filteredText
    }
}
