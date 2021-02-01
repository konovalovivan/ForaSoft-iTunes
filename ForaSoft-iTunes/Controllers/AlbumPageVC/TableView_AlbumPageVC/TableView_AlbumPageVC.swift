import UIKit
import AVFoundation

extension AlbumPageVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { result.album.trackList.count - 1 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AlbumPageVCCell.reuseId, for: indexPath) as! AlbumPageVCCell
        let trackList = result.album.trackList
        let index = indexPath.row + 1
        if index < trackList.count {
            cell.configuration(trackList[index])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        let _ = self.tableView.indexPathForSelectedRow // lastIndex
        tableView.visibleCells.forEach({
            $0.backgroundView?.removeFromSuperview()
        })
        self.audioPlayer.stop()
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! AlbumPageVCCell
        if let assetURL = URL(string: cell.track.previewUrl) {
            let asset = AVAsset(url: assetURL)
            self.audioPlayer.start(asset)
            let playView = UIView(frame: .init(origin: .zero, size: CGSize(width: 0, height: cell.bounds.height)))
            playView.backgroundColor = UIColor.systemRed.withAlphaComponent(1/3)
            cell.backgroundView = playView
            UIView.animate(withDuration: asset.duration.seconds, delay: 0.1, options: .curveLinear, animations: {
                playView.frame.size.width = cell.bounds.width
            }, completion: { _ in
                playView.removeFromSuperview()
            })
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
