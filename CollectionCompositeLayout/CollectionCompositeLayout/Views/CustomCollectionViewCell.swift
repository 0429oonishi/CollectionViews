//
//  CustomCollectionViewCell.swift
//  CollectionCompositeLayout
//
//  Created by 大西玲音 on 2021/04/09.
//

import UIKit

final class CustomCollectionViewCell: UICollectionViewCell {

    static var identifier: String {
        return String(describing: self)
    }
    
    private let colors: [UIColor] = [.red,
                                     .blue,
                                     .green,
                                     .yellow,
                                     .orange,
                                     .cyan,
                                     .magenta
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = colors.randomElement()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
