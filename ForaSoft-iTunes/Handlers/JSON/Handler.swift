import Foundation

struct Handler {
    static func jsonDecoder<T: Codable>(_ data: Data) -> T {
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse as \(T.self):\n\(error)")
        }
    }
}
