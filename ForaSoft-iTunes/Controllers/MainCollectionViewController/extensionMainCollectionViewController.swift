import Foundation
import UIKit

extension MainCollectionViewController {
    private(set) static var searchController: SearchController! = .init(searchResultsController: nil)
    private(set) static var numberOfItemsPerRow: CGFloat = 2
    private(set) static var spacing: CGFloat = 16
}
