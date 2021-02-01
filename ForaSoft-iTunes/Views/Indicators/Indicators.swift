import UIKit

struct Indicators {
    static let bounds = UIScreen.main.bounds
    
    static var network: NetworkIndicatorView = {
        let w: CGFloat = bounds.size.width * 0.75
        let h: CGFloat = 50.0
        let size = CGSize(width: w, height: h)
        return NetworkIndicatorView(frame: CGRect(origin: .zero, size: size))
    }()
    
    static var loading: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.center = bounds.center
        indicator.startAnimating()
        return indicator
    }()
    
    static var failLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Medium", size: 24)
        label.text = "No results match your request"
        label.sizeToFit()
        label.center = bounds.center
        label.isUserInteractionEnabled = false
        return label
    }()
}
