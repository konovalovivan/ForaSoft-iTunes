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
    
    func testAPIRequest() {
        let expectation = XCTestExpectation(description: "Test download data on demand")
        API.request("Queen")
        Dispatcher.groups.request.notify(queue: .main, execute: { () -> Void in
            expectation.fulfill()
            XCTAssertNotNil(Storage.request, "Storage with requests is empty")
            print("✅ First artist name in results:", String(describing: Storage.request?.results.first?.artistName))
        })
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testPerformanceExample() throws {
        self.measure { }
    }
}
