import UIKit

class SearchController: UISearchController {
    
    weak var mainVC: MainCollectionViewController?
    
    private(set) public var collectionView: UICollectionView! {
        didSet {
            collectionView.register(CellWithLastReq.self, forCellWithReuseIdentifier: CellWithLastReq.reuseId)
            collectionView.dataSource = self
            collectionView.delegate = self
        }
    }
    
    //MARK: -- viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView = .init(frame: searchBar.frame, collectionViewLayout: UICollectionViewFlowLayout())
        
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { fatalError("CVLayout") }
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.sectionInset = .init(top: 0, left: 10, bottom: 0, right: 10)
        layout.scrollDirection = .horizontal
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.alwaysBounceHorizontal = true
        
        collectionView.backgroundView = blurView(frame: collectionView.frame)
        collectionView.backgroundColor = .clear
        
        view.addSubview(collectionView)
    }
    
    //MARK: -- viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionViewHidden(enable: animated)
        collectionView.reloadData()
    }
    
    //MARK: -- viewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.performBatchUpdates({
            if let point = searchBar.superview?.layer.frame.maxY {
                collectionView.layer.frame.origin.y = point
            } else {
                collectionView.isHidden = true
            }
        }, completion: { [weak self] (finish) -> Void in
            guard !Storage.searchBar.array.isEmpty else { return }
            self?.collectionViewHidden(enable: !finish)
        })
    }
    
    //MARK: -- viewWillDisappear
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        collectionViewHidden(enable: animated)
    }
    
    //MARK: -- init
    override init(searchResultsController: UIViewController?) {
        super.init(searchResultsController: searchResultsController)
        searchBar.placeholder = "Enter the artist..."
        searchBar.autocapitalizationType = .none
        searchBar.autocorrectionType = .no
    }
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SearchController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionViewHidden(enable: Storage.searchBar.array.isEmpty)
        return Storage.searchBar.array.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellWithLastReq.reuseId, for: indexPath) as! CellWithLastReq
        let text = Storage.searchBar.array[indexPath.row]
        cell.configuration(text)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sc = MainCollectionViewController.searchController
        let sbtext = sc.searchBar.text
        guard let cell = collectionView.cellForItem(at: indexPath) as? CellWithLastReq, let text = cell.label.text else { return }
        switch sbtext != text {
        case true:
            mainVC?.searchBar(searchBar, textDidChange: text)
            sc.isActive = false
        default:
            sc.isActive = false
        }
    }
}

extension SearchController {
    fileprivate func collectionViewHidden(enable: Bool) {
        collectionView.layoutIfNeeded()
        UIView.animate(withDuration: 0.15, animations: { [weak self] in
            self?.collectionView.alpha = enable ? 0 : 1
        }, completion: { [weak self] (action) -> Void in
            self?.collectionView.layoutIfNeeded()
            self?.collectionView.backgroundView?.isHidden = enable
            self?.collectionView.isHidden = enable
        })
    }
    fileprivate func blurView(frame: CGRect) -> UIVisualEffectView {
        let blurEffect = UIBlurEffect(style: .regular)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = frame
        blurView.backgroundColor = .systemBackground
        blurView.isOpaque = true
        blurView.alpha = 0.5
        return blurView
    }
}
