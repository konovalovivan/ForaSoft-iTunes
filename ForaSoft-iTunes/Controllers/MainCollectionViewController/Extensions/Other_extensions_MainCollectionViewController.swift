import Foundation
import UIKit

extension MainCollectionViewController {
    static let spacing: CGFloat = 16.0
    static let searchController = SearchController(searchResultsController: nil)
    
    internal func flowLayoutConfig() {
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { fatalError() }
        
        let S = Self.spacing
        layout.scrollDirection = .vertical
        layout.sectionHeadersPinToVisibleBounds = false
        layout.sectionInset = .init(top:S, left:S, bottom:S, right:S)
    }
    
    internal func navigationControllerConfig() {
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.searchController = Self.searchController
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemBackground
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
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
