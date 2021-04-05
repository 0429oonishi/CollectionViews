//
//  MyCollectionViewCell.swift
//  HeaderFooterCollectionView
//
//  Created by 大西玲音 on 2021/04/05.
//

import UIKit

final class MyCollectionViewCell: UICollectionViewCell {
        
    static var toString: String {
        return String(describing: self)
    }
    static let id = MyCollectionViewCell.toString
    static func nib() -> UINib {
        return UINib(nibName: MyCollectionViewCell.toString, bundle: nil)
    }
    
    func configure() {
        backgroundColor = .red
    }
    
}
