import UIKit

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
        Self.searchController.searchBar.delegate = self
        Self.searchController.delegate = self
        Self.searchController.mainVC = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        flowLayoutConfig()
        navigationControllerConfig()
        Self.searchController.searchBar.text = Storage.searchBar.text
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
        // - - - - - - - - - - - - - - -
        super.viewDidDisappear(animated)
        networkIndicator(!animated, nil)
    }
    
    // MARK: -- UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Storage.request?.resultCount ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCell.reuseId, for: indexPath) as! AlbumCell
        let req = Storage.request
        if let rc = req?.resultCount, rc > 0 && indexPath.row < rc {
            if let result = req?.results[indexPath.row] {
                cell.config(result)
            }
        }
        return cell
    }
    
    init() {
        // Fix: initialized with a non-nil layout parameter
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
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
