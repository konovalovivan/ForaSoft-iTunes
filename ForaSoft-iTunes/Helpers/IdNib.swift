import UIKit

extension UIViewController {
    static let id = String(describing: self)
    static let nib = UINib(nibName: id, bundle: nil)
}

extension UITableViewCell {
    static let reuseId = String(describing: self)
    static let nib = UINib(nibName: reuseId, bundle: nil)
}

extension UICollectionViewCell {
    static let reuseId = String(describing: self)
    static let nib = UINib(nibName: reuseId, bundle: nil)
}
