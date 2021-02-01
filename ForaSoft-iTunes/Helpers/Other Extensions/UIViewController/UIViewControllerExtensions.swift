import UIKit

extension UIViewController {
    func networkIndicator(_ activate: Bool, _ indicator: ((NetworkIndicatorView)->Void)? = nil) {
        guard let delegate = (UIApplication.shared.delegate as? SceneDelegate) else { return }
        delegate.monitorConfig(activate: activate)
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
