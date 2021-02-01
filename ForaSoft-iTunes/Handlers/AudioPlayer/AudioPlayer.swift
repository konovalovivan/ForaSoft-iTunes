import Foundation
import AVFoundation

class AudioPlayer {
    
    private(set) var avPlayer: AVPlayer?
    private(set) var avPlayerItem: AVPlayerItem?
    private(set) var avAudioSession: AVAudioSession!
    
    func stop() {
        guard let player = avPlayer else { return }
        player.pause()
        player.seek(to: CMTimeMake(value: 0, timescale: 1))
    }
    
    func start(_ asset: AVAsset) {
        avPlayerItem = .init(asset: asset)
        
        do {
            try avAudioSession.setMode(.default)
            try avAudioSession.setCategory(.playback, mode: .default, options: [])
            try avAudioSession.setActive(true, options: [.notifyOthersOnDeactivation])
            
            guard let playerItem = avPlayerItem else { fatalError("AVPlayerItem not found") }
            avPlayer = .init(playerItem: playerItem)
            guard let player = avPlayer else { fatalError("AVPlayer not found") }
            player.play()
        } catch let error {
            print("AVAudioSession:", error.localizedDescription)
        }
    }
    
    init() {
        self.avAudioSession = AVAudioSession.sharedInstance()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
