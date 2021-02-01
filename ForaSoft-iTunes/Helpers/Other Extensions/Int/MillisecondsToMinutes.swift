import Foundation

extension Int {
    /// Extension for converting milliseconds into a pleasant and human-readable form of minutes with seconds
    /// ```
    /// Example: 201904 -> "03:21"
    /// ```
    func msToMinutes() -> String {
        let date = Date(timeIntervalSince1970: Double(self) / 1000)
        let formatter = DateFormatter()
        formatter.dateFormat = "mm:ss"
        let result = formatter.string(from: date as Date)
        return result
    }
}
