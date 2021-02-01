import Foundation
import UIKit

extension MainCollectionViewController {
    private(set) static var searchController: SearchController! = .init(searchResultsController: nil)
    private(set) static var numberOfItemsPerRow: CGFloat = 2
    private(set) static var spacing: CGFloat = 16
    
    internal func flowLayoutConfig() {
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { fatalError() }
        let N = Self.spacing
        layout.scrollDirection = .vertical
        layout.sectionHeadersPinToVisibleBounds = false
        layout.minimumLineSpacing = N
        layout.minimumInteritemSpacing = N
        layout.sectionInset = .init(top:N,left:N,bottom:N,right:N)
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
