import UIKit

class AlbumCell: UICollectionViewCell {
    
    @IBOutlet weak var albumCoverImageView: UIImageView!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var collectionNameLabel: UILabel!
    
    public func config(_ result: Result) {
        guard let imageData = result.image100_data else { return }
        albumCoverImageView.image = UIImage(data: imageData) ?? UIImage(named: "albumcover_placeholder")
        artistNameLabel.text = result.artistName
        collectionNameLabel.text = result.collectionName
    }
    
    fileprivate func view_album_image_customizer() {
        albumCoverImageView.layoutIfNeeded()
        albumCoverImageView.layer.borderWidth = 1
        albumCoverImageView.layer.borderColor = artistNameLabel.textColor.withAlphaComponent(0.5).cgColor
        albumCoverImageView.layer.cornerRadius = layer.cornerRadius
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.cornerRadius()
        view_album_image_customizer()
    }
}
