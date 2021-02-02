import UIKit

class AlbumCell: UICollectionViewCell {
    
    @IBOutlet weak var albumCoverImageView: UIImageView!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var collectionNameLabel: UILabel!
    
    public func config(_ result: Result) {
        if let imageData = result.image100_data ?? UIImage(named: "albumcover_placeholder")?.pngData() {
            albumCoverImageView.image = UIImage(data: imageData)
            albumCoverImageView.layer.borderWidth = 1
            albumCoverImageView.layer.borderColor = artistNameLabel.textColor.withAlphaComponent(0.5).cgColor
            albumCoverImageView.cornerRadius()
        }
        artistNameLabel.text = result.artistName
        collectionNameLabel.text = result.collectionName
    }
}
