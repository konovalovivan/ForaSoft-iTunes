import UIKit
import SafariServices
import AVFoundation

class AlbumPageVC: UIViewController {
    
    @IBOutlet weak var albumCover: UIImageView!
    @IBOutlet weak var albumTitle: UILabel!
    @IBOutlet weak var genreAndYear: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    private(set) var result: Result!
    var outputStream: OutputStream?
    
    //MARK: -- Apple Music (Safari)
    private var appleMusicURL: URL!
    private var appleMusicSafariVC: SFSafariViewController!
    @objc func appleMusicSafariOpen() {
        present(appleMusicSafariVC, animated: true, completion: {
            API.post(postbody: ["User did open Apple Music site" : self.appleMusicURL.absoluteString])
        })
    }
    // Apple Music (setRightBarButton)
    private func RBarButton() -> UIBarButtonItem {
        let button = AppleMusicBarButton()
        let selector: Selector = #selector(appleMusicSafariOpen)
        button.addTarget(self, action: selector, for: .touchUpInside)
        return UIBarButtonItem(customView: button)
    }
    private(set) var audioPlayer = AudioPlayer()
    
    func configuration(_ result: Result) {
        self.result = result
        albumCover.image = UIImage(data: result.image100_data!)
        albumCover.layer.cornerRadius = 10
        albumTitle.text = result.collectionName
        genreAndYear.text = result.primaryGenreName + " ∙ " + result.releaseDate.prefix(4) // year
        appleMusicURL = URLS.appleMusic(result.collectionName, result.collectionId)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(AlbumPageVCCell.nib, forCellReuseIdentifier: AlbumPageVCCell.reuseId)
        tableView.dataSource = self
        tableView.delegate = self
        
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.tableFooterView = .init() // rm extra empty cells
        tableView.reloadData()
        
        appleMusicSafariVC = .init(url: self.appleMusicURL)
        navigationItem.setRightBarButton(RBarButton(), animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.setRightBarButton(nil, animated: animated)
    }
}
