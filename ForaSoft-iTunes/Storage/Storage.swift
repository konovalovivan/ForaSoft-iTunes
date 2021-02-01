import Foundation

final class Storage {
    
    public static var cache: NSCache<NSURL,NSData> = .init()
    
    private(set) static public var request: Request?
    
    enum searchBar {
        static var text: String = .init()
        static var array: [String] = .init() {
            didSet {
                if let last: String = array.last {
                    API.post(postbody: ["Storage.searchBar.array.last":last])
                }
            }
        }
    }
    
    public static func updater<T>(_ value: T) {
        switch value {
        case let value as Request:
            request = value
            Dispatcher.groups.request.leave()
        default:
            fatalError("unknown type")
        }
    }
    
    fileprivate init() { }
}
