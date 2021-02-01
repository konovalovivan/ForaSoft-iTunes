import XCTest
@testable import ForaSoft_iTunes

class ForaSoft_iTunesTests: XCTestCase {
    
    override func setUpWithError() throws { }
    override func tearDownWithError() throws {}
    
    func testNavigationViewController() throws {
        let currentScene = UIApplication.shared.delegate as? SceneDelegate
        if let scene = currentScene {
            if let root = scene.window?.rootViewController {
                XCTAssertTrue(root.isKind(of: NavigationViewController.self))
            } else {
                XCTFail("rootViewController: NOT FOUND")
            }
        } else {
            XCTAssertNil(currentScene, "CHECK: SceneDelegate")
        }
    }
    
    func testPerformanceExample() throws {
        self.measure { }
    }
}
