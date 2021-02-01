import UIKit

extension UIDevice {
    enum network {
        enum ip {
            static func local() -> String? {
                var ifaddr: UnsafeMutablePointer<ifaddrs>?
                guard getifaddrs(&ifaddr) == 0, let first = ifaddr else { fatalError() }
                var netmask = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                
                for ptr in sequence(first: first, next: { $0.pointee.ifa_next }) {
                    var addr = ptr.pointee.ifa_addr.pointee
                    let family = addr.sa_family
                    let bsd = (IFF_UP|IFF_RUNNING)
                    
                    if (Int32(ptr.pointee.ifa_flags) & (bsd|IFF_LOOPBACK)) == (bsd) {
                        if family == AF_INET || family == AF_INET6 {
                            if (getnameinfo(&addr, socklen_t(addr.sa_len), &netmask, socklen_t(netmask.count), nil, socklen_t(0), NI_NUMERICHOST) == 0) {
                                let address = String(cString: netmask, encoding: .utf8)
                                return address
                            }
                        }
                    }
                }
                freeifaddrs(ifaddr)
                return nil
            }
            static func external(_ completion: @escaping (String?) -> ()) {
                let config: URLSessionConfiguration = .ephemeral
                config.waitsForConnectivity = true
                config.httpCookieAcceptPolicy = .never
                config.httpCookieStorage = nil
                config.multipathServiceType = .interactive
                config.urlCache = nil
                config.networkServiceType = .responsiveData
                let task = URLSession(configuration: config).dataTask(with: URL(string: URLS.ipbot)!, completionHandler: { (data,_,_) in
                    guard let data = data else { return }
                    completion(String(data: data, encoding: .utf8))
                })
                task.resume()
            }
        }
    }
}
