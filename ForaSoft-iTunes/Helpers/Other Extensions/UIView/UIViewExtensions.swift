import UIKit

extension UIView {
    /// (bounds.height / bounds.width) * factor
    func cornerRadius(factor: CGFloat = 10.0) {
        layer.cornerRadius = (bounds.height/bounds.width) * factor
    }
    func shadow(_ view_bgColor: UIColor = .systemBackground) {
        backgroundColor = view_bgColor
        layer.masksToBounds = false
        layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 0.5)
        layer.shadowOffset = .zero
        layer.shadowRadius = 3.5
        layer.shadowOpacity = 1.0
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath
    }
    
    func centerConstraints(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            view.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
