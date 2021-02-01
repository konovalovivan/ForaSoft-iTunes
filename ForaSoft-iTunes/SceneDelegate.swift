import UIKit
import Network

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    internal(set) public var window: UIWindow?
    private(set) public var monitor: NWPathMonitor!
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = .init(windowScene: windowScene)
        guard let window = window else { fatalError("UIWindow not found") }
        window.rootViewController = NavigationViewController()
        window.makeKeyAndVisible()
        self.monitor = .init()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) { }
    func sceneDidBecomeActive(_ scene: UIScene) { }
    func sceneWillResignActive(_ scene: UIScene) { }
    func sceneWillEnterForeground(_ scene: UIScene) { }
    func sceneDidEnterBackground(_ scene: UIScene) { }
}
