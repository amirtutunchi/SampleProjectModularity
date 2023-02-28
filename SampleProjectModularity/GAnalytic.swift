class GAnalytic {
    private static var _sharedInstance: GAnalytic?
    public var customDimensions = [String]()
    public static var sharedInstance: GAnalytic {
        if let sharedInstance = _sharedInstance {
            return sharedInstance
        } else {
            _sharedInstance = GAnalytic()
            return _sharedInstance!
        }
    }
    
    private init() { }
    
    public func sendEvent(eventName: String) {
        print("event \(eventName) sended, Custom dimensions is \(customDimensions)")
    }
}
