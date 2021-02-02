import UIKit
import Network

extension UIViewController {
    func networkIndicator(_ monitor: NWPathMonitor, _ activate: Bool, _ indicator: ((NetworkIndicatorView)->Void)? = nil) {
        guard activate else { monitor.cancel(); return }
        let queue = Dispatcher.queues.monitor
        
        monitor.pathUpdateHandler = { (path) -> Void in
            // print("NWPath.Status:", path.status)
            var attempts = 0 // { didSet { print(attempts) }}
            let ind = Indicators.network
            let nw = UIDevice.network.self
            var ip: String? { didSet { ind.external_ip(ip) }}
            queue.async {
                if nw.ip.local() != nil {
                    while (attempts == 10 || ip == nil) {
                        defer { attempts += 1 }
                        ind.local_ip(nw.ip.local())
                        nw.ip.external { ip = $0 }
                        usleep(500000)
                    }
                } else {
                    ind.dc()
                }
            }
            // if TARGET_IPHONE_SIMULATOR == 1 { extractedFunc() } else { extractedFunc() }
        }
        monitor.start(queue: queue)
        guard activate == true, let completion = indicator else { return }
        completion(Indicators.network)
    }
    public var topBarHeight: CGFloat {
        let app = UIApplication.shared
        if let navbar = navigationController?.navigationBar {
            let nbh = navbar.frame.height
            if #available(iOS 13.0, *) {
                if let sb = app.windows.first?.windowScene?.statusBarManager {
                    let result = nbh + sb.statusBarFrame.height
                    return result
                } else {
                    return 0.0
                }
            } else {
                let result = nbh + app.statusBarFrame.height
                return result
            }
        } else {
            return 0.0
        }
    }
}
