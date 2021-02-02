//import UIKit
//
//extension SceneDelegate {
//    func monitorConfig(activate: Bool) {
//        guard activate else { self.monitor.cancel(); return }
//        let queue = Dispatcher.queues.monitor
//        
//        self.monitor.pathUpdateHandler = { (path) -> Void in
//            // print("NWPath.Status:", path.status)
//            var attempts = 0 // { didSet { print(attempts) }}
//            let ind = Indicators.network
//            let nw = UIDevice.network.self
//            var ip: String? { didSet { ind.external_ip(ip) }}
//            queue.async {
//                if nw.ip.local() != nil {
//                    while (attempts == 10 || ip == nil) {
//                        defer { attempts += 1 }
//                        ind.local_ip(nw.ip.local())
//                        nw.ip.external { ip = $0 }
//                        usleep(500000)
//                    }
//                } else {
//                    ind.dc()
//                }
//            }
//            // if TARGET_IPHONE_SIMULATOR == 1 { extractedFunc() } else { extractedFunc() }
//        }
//        self.monitor.start(queue: queue)
//    }
//}
