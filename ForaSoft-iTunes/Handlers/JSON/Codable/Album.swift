import Foundation

public struct Album: Codable {
    
    public var resultCount: Int
    public var trackList: [Track]
    
    private enum CodingKeys: String, CodingKey {
        case resultCount = "resultCount"
        case trackList = "results"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        resultCount = try values.decodeIfPresent(Int.self, forKey: .resultCount) ?? .init()
        trackList = try values.decodeIfPresent([Track].self, forKey: .trackList) ?? .init()
    }
}
