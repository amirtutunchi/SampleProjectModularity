import Foundation

struct AdViewModel {
    let name: String
    let price: String
    let sellerName: String
    let website: URL?
    let image: URL?
    
    public init(searchAd: SearchAdModel) {
        name = searchAd.ad.name
        price = searchAd.ad.price.priceString
        sellerName = searchAd.ad.seller.name
        website = URL(string: searchAd.ad.seller.website ?? "")
        image = URL(string: searchAd.ad.image ?? "")
    }
}
