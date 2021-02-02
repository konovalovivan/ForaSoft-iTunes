import UIKit
import Network

class MainCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let networkMonitor: NWPathMonitor = NWPathMonitor()
    
    fileprivate func collectionViewConfig() {
        clearsSelectionOnViewWillAppear = false
        collectionView!.register(AlbumCell.nib, forCellWithReuseIdentifier: AlbumCell.reuseId)
        collectionView!.backgroundColor = .systemBackground
        collectionView!.keyboardDismissMode = .onDrag
        collectionView!.alwaysBounceVertical = true
        collectionView!.isPrefetchingEnabled = true
        collectionView!.setNeedsLayout()
        collectionView!.layoutIfNeeded()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "iTunes Search"
        view.backgroundColor = .systemBackground
        
        collectionViewConfig()
        Self.searchController.searchBar.delegate = self
        Self.searchController.delegate = self
        Self.searchController.mainVC = self
        
        view.addSubview(Indicators.loading)
        view.addSubview(Indicators.failLabel)
        networkIndicator(self.networkMonitor, true, { self.view.addSubview($0) })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        flowLayoutConfig()
        navigationControllerConfig()
        Self.searchController.searchBar.text = Storage.searchBar.text
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        Indicators.loading.isHidden = true
        Indicators.failLabel.isHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
        // - - - - - - - - - - - - - - -
        super.viewDidDisappear(animated)
        networkIndicator(self.networkMonitor, !animated, nil)
    }
    
    init() {
        // Fix: initialized with a non-nil layout parameter
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -- UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
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
    
    // MARK:  -- UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let album = AlbumPageVC.nib.instantiate(withOwner: nil).first as? AlbumPageVC, let result = Storage.request?.results[indexPath.row]
        else { fatalError("AlbumPageVC not found") }
        album.configuration(result)
        // present(album, animated: true, completion: nil)
        navigationController?.pushViewController(album, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Self.spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Self.spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sp = Self.spacing
        let items: CGFloat = 2.0
        let ts = (2 * sp) + ((items - 1) * sp) // total spacing
        let v = (collectionView.bounds.width - ts) / items
        let itemSize = CGSize(width: v, height: v * 1.33)
        return itemSize
    }
}
