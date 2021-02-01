import UIKit

extension UIViewController {
    func networkIndicator(_ activate: Bool, _ completion: ((NetworkIndicatorView)->Void)? = nil) {
        if let delegate = (UIApplication.shared.delegate as? SceneDelegate) {
            delegate.monitorConfig(activate: activate)
            guard activate == true, let indicator = completion else { return }
            indicator(Indicators.network)
        } else {
            fatalError("WTF")
        }
    }
}
