import Foundation

public final class SearchParametersModel: NSObject {
    public var searchTerm: String?
    public var categoryId: Int?
    public var distance = 0
    public var latitude: Double?
    public var longitude: Double?
    
    override public init() {
        super.init()
    }
    
    public init(searchParameters: SearchParametersModel) {
        self.searchTerm = searchParameters.searchTerm
        self.categoryId = searchParameters.categoryId
        self.distance = searchParameters.distance
        self.latitude = searchParameters.latitude
        self.longitude = searchParameters.longitude
    }
}
