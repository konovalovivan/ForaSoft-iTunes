import UIKit

class AlbumPageVCCell: UITableViewCell {
    
    @IBOutlet weak var trackNumber: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var explicitBadge: UIImageView!
    @IBOutlet weak var trackTime: UILabel!
    
    private(set) var track: Track!
    
    func configuration(_ track: Track) {
        self.track = track
        
        trackNumber.text = String(track.trackNumber) + "."
        
        artistName.text = track.artistName
        trackName.text = track.trackName
        
        let date = Date(timeIntervalSince1970: Double(track.trackTimeMillis) / 1000)
        let formatter = DateFormatter()
        formatter.dateFormat = "mm:ss"
        trackTime.text = formatter.string(from: date as Date)
        
        if track.trackExplicitness.lowercased().hasPrefix("exp") {
            explicitBadge.isHidden = false
        }
    }
}
