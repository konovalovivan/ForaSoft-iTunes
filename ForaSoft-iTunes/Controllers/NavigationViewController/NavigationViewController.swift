import UIKit

final class NavigationViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        viewControllers = [MainCollectionViewController()]
    }
}
