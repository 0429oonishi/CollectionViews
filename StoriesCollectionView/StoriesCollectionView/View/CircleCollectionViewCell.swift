//
//  CircleCollectionViewCell.swift
//  StoriesCollectionView
//
//  Created by 大西玲音 on 2021/04/08.
//

import UIKit

final class CircleCollectionViewCell: UICollectionViewCell {
    
    static var toString: String {
        return String(describing: self)
    }
    static let id = CircleCollectionViewCell.toString
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .black
        imageView.layer.cornerRadius = 75
        imageView.layer.borderColor = UIColor.red.cgColor
        imageView.layer.borderWidth = 3
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.frame = contentView.bounds
        
    }
    
    func configure(model: Model) {
        imageView.image = UIImage(named: model.imageName)
    }
    
    override func prepareForReuse() {
        imageView.image = nil
    }
    
}
