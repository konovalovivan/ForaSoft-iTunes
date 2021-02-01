import UIKit

//MARK: -- SearchController's CollectionView Cell

class CellWithLastReq: UICollectionViewCell {
    
    var label: UILabel = .init()
    
    func configuration(_ string: String) {
        label.text = string
        label.sizeToFit()
    }
    
    override func didAddSubview(_ subview: UIView) {
        super.didAddSubview(subview)
        layoutConstraints(pointSize: label.font.pointSize)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let p: CGFloat = -(sqrt(frame.width)/2)
        layer.cornerRadius = abs(p * 2)
        
        backgroundColor = #colorLiteral(red: 0, green: 0.4797514677, blue: 0.9984372258, alpha: 1)
        addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CellWithLastReq {
    fileprivate func layoutConstraints(pointSize: CGFloat = 0) {
        self.centerConstraints(view: label)
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(
                greaterThanOrEqualTo: label.topAnchor,
                constant: pointSize / 2),
            self.leadingAnchor.constraint(
                greaterThanOrEqualTo: label.leadingAnchor,
                constant: pointSize),
            self.trailingAnchor.constraint(
                greaterThanOrEqualTo: label.trailingAnchor,
                constant: pointSize),
            self.bottomAnchor.constraint(
                greaterThanOrEqualTo: label.bottomAnchor,
                constant: pointSize / 2)
        ])
    }
}
