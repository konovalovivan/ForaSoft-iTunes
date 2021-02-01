import UIKit

extension MainCollectionViewController {
    // private(set) static var searchController: SearchController!
    private(set) static var numberOfItemsPerRow: CGFloat = 2
    private(set) static var spacing: CGFloat = 16
}

class MainCollectionViewController: UICollectionViewController {
    
    fileprivate func collectionViewConfig() {
        collectionView!.register(AlbumCell.self, forCellWithReuseIdentifier: AlbumCell.reuseId)
        collectionView.backgroundColor = .systemBackground
        collectionView.keyboardDismissMode = .onDrag
        collectionView.alwaysBounceVertical = true
        collectionView.isPrefetchingEnabled = true
        collectionView.setNeedsLayout()
        collectionView.layoutIfNeeded()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Main Screen"
        view.backgroundColor = .systemBackground
        
        collectionViewConfig()
    }
    
    func flowLayoutConfig() {
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { fatalError() }
        let N = Self.spacing
        layout.scrollDirection = .vertical
        layout.sectionHeadersPinToVisibleBounds = false
        layout.minimumLineSpacing = N
        layout.minimumInteritemSpacing = N
        layout.sectionInset = .init(top:N,left:N,bottom:N,right:N)
    }
    
    func navigationControllerConfig() {
        navigationItem.largeTitleDisplayMode = .always
        // navigationItem.searchController = searchController
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        flowLayoutConfig()
        navigationControllerConfig()
    }
    
    // MARK: -- UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCell.reuseId, for: indexPath)
        
        return cell
    }
    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
    }
    convenience init() {
        self.init(collectionViewLayout: UICollectionViewLayout())
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:  -- UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
}
