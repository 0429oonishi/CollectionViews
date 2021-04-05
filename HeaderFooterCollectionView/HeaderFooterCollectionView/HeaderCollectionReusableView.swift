//
//  HeaderCollectionReusableView.swift
//  HeaderFooterCollectionView
//
//  Created by 大西玲音 on 2021/04/05.
//

import UIKit

final class HeaderCollectionReusableView: UICollectionReusableView {
    
    static var toString: String {
        return String(describing: self)
    }
    static let id = HeaderCollectionReusableView.toString
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "header"
        label.font = .systemFont(ofSize: 50)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    func configure() {
        backgroundColor = .green
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
    
}


