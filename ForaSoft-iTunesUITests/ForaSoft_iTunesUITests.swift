import XCTest

class ForaSoft_iTunesUITests: XCTestCase {
    
    private static var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws { }
    
    override class func setUp() {
        self.app = XCUIApplication()
        self.app.launch()
    }
    
    func testSearchBar() throws {
        
        let string: String = "Queen" // example request
        
        let searchBar = Self.app.navigationBars.searchFields.element
        searchBar.tap()
        searchBar.typeText(string)
        Self.app.otherElements["PopoverDismissRegion"].tap()
        wait(for: .init(), timeout: 3.0)
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                // XCUIApplication().launch()
            }
        }
    }
}
