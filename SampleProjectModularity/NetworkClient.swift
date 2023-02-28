import Foundation

class NetworkClient {
    private static var _sharedInstance: NetworkClient?
    public static var sharedInstance: NetworkClient {
        if let sharedInstance = _sharedInstance {
            return sharedInstance
        } else {
            _sharedInstance = NetworkClient()
            return _sharedInstance!
        }
    }
    
    private init() { }
    
    func getAds(completion: ([SearchAdModel]) -> Void ) {
        let sellerWithoutWebsite = Seller(name: "Ali", website: nil)
        let seller = Seller(name: "Jack", website: "https://www.google.com")
        let price = Price(priceAmount: 1000, priceString: "1000 $")
        let ad1 = AdModel(
            id: UUID().uuidString,
            name: "Car", price: price,
            seller: sellerWithoutWebsite,
            image: "https://picsum.photos/200"
        ).toSearchAdModel()
        let ad2 = AdModel(
            id: UUID().uuidString,
            name: "Cat",
            price: price,
            seller: seller,
            image: "https://picsum.photos/200"
        ).toSearchAdModel()
        let ad3 = AdModel(
            id: UUID().uuidString,
            name: "Umbrella",
            price: price,
            seller: sellerWithoutWebsite,
            image: "https://picsum.photos/200"
        ).toSearchAdModel()
        let ad4 = AdModel(
            id: UUID().uuidString,
            name: "Microphone",
            price: price,
            seller: seller,
            image: nil
        ).toSearchAdModel()
        let ad5 = AdModel(
            id: UUID().uuidString,
            name: "Guitar",
            price: price,
            seller: sellerWithoutWebsite,
            image: "https://picsum.photos/200"
        ).toSearchAdModel()
        let ad6 = AdModel(
            id: UUID().uuidString,
            name: "Piano",
            price: price,
            seller: seller,
            image: "https://picsum.photos/200"
        ).toSearchAdModel()
        let ads = [ad1, ad2, ad3, ad4, ad5, ad6]
        completion(ads)
    }
}
