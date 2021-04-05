//
//  FooterCollectionReusableView.swift
//  HeaderFooterCollectionView
//
//  Created by 大西玲音 on 2021/04/05.
//

import UIKit

final class FooterCollectionReusableView: UICollectionReusableView {
    
    static var toString: String {
        return String(describing: self)
    }
    static let id = FooterCollectionReusableView.toString
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "footer"
        label.font = .systemFont(ofSize: 50)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    func configure() {
        backgroundColor = .blue
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
    
}
