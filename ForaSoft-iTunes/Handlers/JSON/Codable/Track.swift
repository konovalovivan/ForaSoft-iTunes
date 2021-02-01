import Foundation

public struct Track: Codable {
    public var amgArtistId: Int
    public var artistId: Int
    public var artistName: String
    public var artistViewUrl: String
    public var artworkUrl100: String
    public var artworkUrl30: String
    public var artworkUrl60: String
    public var collectionArtistId: Int
    public var collectionArtistName: String
    public var collectionArtistViewUrl: String
    public var collectionCensoredName: String
    public var collectionExplicitness: String
    public var collectionId: Int
    public var collectionName: String
    public var collectionPrice: Double
    public var collectionType: String
    public var collectionViewUrl: String
    public var copyright: String
    public var country: String
    public var currency: String
    public var discCount: Int
    public var discNumber: Int
    public var isStreamable: Bool
    public var kind: String
    public var previewUrl: String
    public var primaryGenreName: String
    public var releaseDate: String
    public var trackCensoredName: String
    public var trackCount: Int
    public var trackExplicitness: String
    public var trackId: Int
    public var trackName: String
    public var trackNumber: Int
    public var trackPrice: Double
    public var trackTimeMillis: Int
    public var trackViewUrl: String
    public var wrapperType: String
    
    enum CodingKeys: String, CodingKey {
        case amgArtistId = "amgArtistId"
        case artistId = "artistId"
        case artistName = "artistName"
        case artistViewUrl = "artistViewUrl"
        case artworkUrl100 = "artworkUrl100"
        case artworkUrl30 = "artworkUrl30"
        case artworkUrl60 = "artworkUrl60"
        case collectionArtistId = "collectionArtistId"
        case collectionArtistName = "collectionArtistName"
        case collectionArtistViewUrl = "collectionArtistViewUrl"
        case collectionCensoredName = "collectionCensoredName"
        case collectionExplicitness = "collectionExplicitness"
        case collectionId = "collectionId"
        case collectionName = "collectionName"
        case collectionPrice = "collectionPrice"
        case collectionType = "collectionType"
        case collectionViewUrl = "collectionViewUrl"
        case copyright = "copyright"
        case country = "country"
        case currency = "currency"
        case discCount = "discCount"
        case discNumber = "discNumber"
        case isStreamable = "isStreamable"
        case kind = "kind"
        case previewUrl = "previewUrl"
        case primaryGenreName = "primaryGenreName"
        case releaseDate = "releaseDate"
        case trackCensoredName = "trackCensoredName"
        case trackCount = "trackCount"
        case trackExplicitness = "trackExplicitness"
        case trackId = "trackId"
        case trackName = "trackName"
        case trackNumber = "trackNumber"
        case trackPrice = "trackPrice"
        case trackTimeMillis = "trackTimeMillis"
        case trackViewUrl = "trackViewUrl"
        case wrapperType = "wrapperType"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        amgArtistId = try values.decodeIfPresent(Int.self, forKey: .amgArtistId) ?? .init()
        artistId = try values.decodeIfPresent(Int.self, forKey: .artistId) ?? .init()
        artistName = try values.decodeIfPresent(String.self, forKey: .artistName) ?? .init()
        artistViewUrl = try values.decodeIfPresent(String.self, forKey: .artistViewUrl) ?? .init()
        artworkUrl100 = try values.decodeIfPresent(String.self, forKey: .artworkUrl100) ?? .init()
        artworkUrl30 = try values.decodeIfPresent(String.self, forKey: .artworkUrl30) ?? .init()
        artworkUrl60 = try values.decodeIfPresent(String.self, forKey: .artworkUrl60) ?? .init()
        collectionArtistId = try values.decodeIfPresent(Int.self, forKey: .collectionArtistId) ?? .init()
        collectionArtistName = try values.decodeIfPresent(String.self, forKey: .collectionArtistName) ?? .init()
        collectionArtistViewUrl = try values.decodeIfPresent(String.self, forKey: .collectionArtistViewUrl) ?? .init()
        collectionCensoredName = try values.decodeIfPresent(String.self, forKey: .collectionCensoredName) ?? .init()
        collectionExplicitness = try values.decodeIfPresent(String.self, forKey: .collectionExplicitness) ?? .init()
        collectionId = try values.decodeIfPresent(Int.self, forKey: .collectionId) ?? .init()
        collectionName = try values.decodeIfPresent(String.self, forKey: .collectionName) ?? .init()
        collectionPrice = try values.decodeIfPresent(Double.self, forKey: .collectionPrice) ?? .init()
        collectionType = try values.decodeIfPresent(String.self, forKey: .collectionType) ?? .init()
        collectionViewUrl = try values.decodeIfPresent(String.self, forKey: .collectionViewUrl) ?? .init()
        copyright = try values.decodeIfPresent(String.self, forKey: .copyright) ?? .init()
        country = try values.decodeIfPresent(String.self, forKey: .country) ?? .init()
        currency = try values.decodeIfPresent(String.self, forKey: .currency) ?? .init()
        discCount = try values.decodeIfPresent(Int.self, forKey: .discCount) ?? .init()
        discNumber = try values.decodeIfPresent(Int.self, forKey: .discNumber) ?? .init()
        isStreamable = try values.decodeIfPresent(Bool.self, forKey: .isStreamable) ?? .init()
        kind = try values.decodeIfPresent(String.self, forKey: .kind) ?? .init()
        previewUrl = try values.decodeIfPresent(String.self, forKey: .previewUrl) ?? .init()
        primaryGenreName = try values.decodeIfPresent(String.self, forKey: .primaryGenreName) ?? .init()
        releaseDate = try values.decodeIfPresent(String.self, forKey: .releaseDate) ?? .init()
        trackCensoredName = try values.decodeIfPresent(String.self, forKey: .trackCensoredName) ?? .init()
        trackCount = try values.decodeIfPresent(Int.self, forKey: .trackCount) ?? .init()
        trackExplicitness = try values.decodeIfPresent(String.self, forKey: .trackExplicitness) ?? .init()
        trackId = try values.decodeIfPresent(Int.self, forKey: .trackId) ?? .init()
        trackName = try values.decodeIfPresent(String.self, forKey: .trackName) ?? .init()
        trackNumber = try values.decodeIfPresent(Int.self, forKey: .trackNumber) ?? .init()
        trackPrice = try values.decodeIfPresent(Double.self, forKey: .trackPrice) ?? .init()
        trackTimeMillis = try values.decodeIfPresent(Int.self, forKey: .trackTimeMillis) ?? .init()
        trackViewUrl = try values.decodeIfPresent(String.self, forKey: .trackViewUrl) ?? .init()
        wrapperType = try values.decodeIfPresent(String.self, forKey: .wrapperType) ?? .init()
    }
}
