import UIKit

final class NavigationViewController: UINavigationController {
    
    private(set) var mainVC: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainVC = MainCollectionViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setViewControllers([mainVC], animated: animated)
    }
}
