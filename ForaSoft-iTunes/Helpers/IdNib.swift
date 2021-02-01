import UIKit

extension UIViewController {
    static var id: String { String(describing: self )}
    static var nib: UINib { UINib(nibName: id, bundle: nil )}
}

extension UITableViewCell {
    static var reuseId: String { String(describing: self )}
    static var nib: UINib { UINib(nibName: reuseId, bundle: nil )}
}

extension UICollectionViewCell {
    static var reuseId: String { String(describing: self )}
    static var nib: UINib { UINib(nibName: reuseId, bundle: nil )}
}
