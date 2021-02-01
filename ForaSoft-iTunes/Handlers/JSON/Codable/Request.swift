import Foundation

/// JSON Model
public struct Request: Codable {
    
    public var resultCount: Int = .init()
    public var results: [Result] = .init()
    
    private enum CodingKeys: String, CodingKey {
        case resultCount = "resultCount"
        case results = "results"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        resultCount = try values.decode(Int.self, forKey: .resultCount)
        results = try values.decode([Result].self, forKey: .results)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(resultCount, forKey: .resultCount)
        try container.encode(results, forKey: .results)
    }
}
