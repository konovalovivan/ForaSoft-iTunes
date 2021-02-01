import UIKit

class NetworkIndicatorView: UIView {
    
    var label: UILabel! = .init()
    let maxY: CGFloat = UIScreen.main.bounds.maxY
    
    var message: String? {
        didSet {
            DispatchQueue.main.async { [self] () -> Void in
                label.text = message
                label.sizeToFit()
                self.centerConstraints(view: label)
                self.isHidden = false
            }
        }
    }
    
    fileprivate func showMe() {
        UIView.animate(withDuration: 0.5, animations: { [self] in
            guard frame.origin.y == maxY else { return }
            frame.origin.y -= (frame.height * 2)
        })
    }
    
    fileprivate func hideMe() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: { [self] () -> Void in
            UIView.animate(withDuration: 0.5, animations: {
                guard frame.origin.y != maxY else { return }
                frame.origin.y = maxY
            }, completion: { (finish) in
                isHidden = finish
            })
        })
    }
    
    func local_ip(_ ip: String?) {
        // print("local_ip:", ip as Any)
        guard ip != nil else { return }
        message = "Connecting..."
        DispatchQueue.main.async { [weak self] () -> Void in
            self?.backgroundColor = .systemYellow
            self?.showMe()
        }
    }
    
    func external_ip(_ ip: String?) {
        // print("external_ip:", ip as Any)
        guard ip != nil else { return }
        message = "Connected!"
        DispatchQueue.main.async { [weak self] () -> Void in
            self?.backgroundColor = .systemGreen
            self?.hideMe()
        }
    }
    /// Disconnect
    func dc() {
        message = "NO INTERNET"
        DispatchQueue.main.async { [weak self] () -> Void in
            self?.backgroundColor = .systemRed
            self?.showMe()
        }
    }
    
    @objc func closerTap(_ sender: UITapGestureRecognizer?) { hideMe() }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.cornerRadius(factor: 75)
        
        self.frame.origin.y = maxY
        self.center.x = UIScreen.main.bounds.midX
        
        label.textAlignment = .center
        label.font = UIFont(name: "AvenirNext-Bold", size: bounds.size.height / 2.5)
        addSubview(label)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(closerTap(_:)))
        addGestureRecognizer(tap)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
