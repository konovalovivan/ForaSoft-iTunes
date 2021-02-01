import Foundation

public struct Result: Codable {
    public var artistId: Int
    public var artistName: String
    public var artistViewUrl: String
    public var artworkUrl60: String
    public var artworkUrl100: String
    public var collectionCensoredName: String
    public var collectionExplicitness: String
    public var collectionId: Int
    public var collectionName: String
    public var collectionPrice: Double
    public var collectionType: String
    public var collectionViewUrl: String
    public var contentAdvisoryRating: String
    public var copyright: String
    public var country: String
    public var currency: String
    public var primaryGenreName: String
    public var releaseDate: String
    public var trackCount: Int
    public var wrapperType: String
    
    public var image100_data: Data?
    public var album: Album!
    
    private enum CodingKeys: String, CodingKey {
        case artistId = "artistId"
        case artistName = "artistName"
        case artistViewUrl = "artistViewUrl"
        case artworkUrl60 = "artworkUrl60"
        case artworkUrl100 = "artworkUrl100"
        case collectionCensoredName = "collectionCensoredName"
        case collectionExplicitness = "collectionExplicitness"
        case collectionId = "collectionId"
        case collectionName = "collectionName"
        case collectionPrice = "collectionPrice"
        case collectionType = "collectionType"
        case collectionViewUrl = "collectionViewUrl"
        case contentAdvisoryRating = "contentAdvisoryRating"
        case copyright = "copyright"
        case country = "country"
        case currency = "currency"
        case primaryGenreName = "primaryGenreName"
        case releaseDate = "releaseDate"
        case trackCount = "trackCount"
        case wrapperType = "wrapperType"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        artistId = try values.decodeIfPresent(Int.self, forKey: .artistId) ?? .init()
        artistName = try values.decodeIfPresent(String.self, forKey: .artistName) ?? .init()
        artistViewUrl = try values.decodeIfPresent(String.self, forKey: .artistViewUrl) ?? .init()
        artworkUrl60 = try values.decodeIfPresent(String.self, forKey: .artworkUrl60) ?? .init()
        artworkUrl100 = try values.decodeIfPresent(String.self, forKey: .artworkUrl100) ?? .init()
        collectionCensoredName = try values.decodeIfPresent(String.self, forKey: .collectionCensoredName) ?? .init()
        collectionExplicitness = try values.decodeIfPresent(String.self, forKey: .collectionExplicitness) ?? .init()
        collectionId = try values.decodeIfPresent(Int.self, forKey: .collectionId) ?? .init()
        collectionName = try values.decodeIfPresent(String.self, forKey: .collectionName) ?? .init()
        collectionPrice = try values.decodeIfPresent(Double.self, forKey: .collectionPrice) ?? .init()
        collectionType = try values.decodeIfPresent(String.self, forKey: .collectionType) ?? .init()
        collectionViewUrl = try values.decodeIfPresent(String.self, forKey: .collectionViewUrl) ?? .init()
        contentAdvisoryRating = try values.decodeIfPresent(String.self, forKey: .contentAdvisoryRating) ?? .init()
        copyright = try values.decodeIfPresent(String.self, forKey: .copyright) ?? .init()
        country = try values.decodeIfPresent(String.self, forKey: .country) ?? .init()
        currency = try values.decodeIfPresent(String.self, forKey: .currency) ?? .init()
        primaryGenreName = try values.decodeIfPresent(String.self, forKey: .primaryGenreName) ?? .init()
        releaseDate = try values.decodeIfPresent(String.self, forKey: .releaseDate) ?? .init()
        trackCount = try values.decodeIfPresent(Int.self, forKey: .trackCount) ?? .init()
        wrapperType = try values.decodeIfPresent(String.self, forKey: .wrapperType) ?? .init()
        
        image100_data = nil
        album = nil
    }
}
