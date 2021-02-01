import Foundation
import UIKit

extension MainCollectionViewController {
    static let searchController = SearchController(searchResultsController: nil)
    static let numberOfItemsPerRow: CGFloat = 2.0
    static let spacing: CGFloat = 16.0
    
    internal func flowLayoutConfig() {
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { fatalError() }
        let s = Self.spacing
        layout.scrollDirection = .vertical
        layout.sectionHeadersPinToVisibleBounds = false
        layout.minimumLineSpacing = s
        layout.minimumInteritemSpacing = s
        layout.sectionInset = .init(top:s,left:s,bottom:s,right:s)
    }
    
    internal func navigationControllerConfig() {
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.searchController = Self.searchController
        navigationController?.navigationBar.prefersLargeTitles = true
        if let nc = self.navigationController {
            nc.navigationBar.prefersLargeTitles = true
            nc.navigationItem.largeTitleDisplayMode = .always
        } else {
            collectionView?.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        }
    }
}
