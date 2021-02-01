import UIKit

class AppleMusicBarButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let gradient = CAGradientLayer()
        let p: CGFloat = -(sqrt(frame.width)/2) // padding
        let w: CGFloat = frame.width + abs(p * 2)
        let h: CGFloat = frame.height + abs(p * 2)
        gradient.frame = CGRect(x: p, y: p, width: w, height: h)
        gradient.colors = [#colorLiteral(red: 0.9786430001, green: 0.1470539868, blue: 0.2423679531, alpha: 1).cgColor, #colorLiteral(red: 0.9841329455, green: 0.3463570476, blue: 0.4396018982, alpha: 1).cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        gradient.cornerRadius = abs(p * 2)
        layer.insertSublayer(gradient, at: 0)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setTitle("Music", for: .normal)
        setTitleColor(.black, for: .normal)
        
        let icon = UIImage(systemName: "applelogo")!
        setImage(icon.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AppleMusicBarButton {
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        next?.touchesEnded(touches, with: event)
    }
}
