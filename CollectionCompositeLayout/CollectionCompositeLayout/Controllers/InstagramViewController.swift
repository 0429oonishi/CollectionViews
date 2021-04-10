//
//  InstagramViewController.swift
//  CollectionCompositeLayout
//
//  Created by 大西玲音 on 2021/04/09.
//

import UIKit

//異なるサイズのItemを併用
final class InstagramViewController: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.collectionViewLayout = UICollectionViewCompositionalLayout(
            section: instagramSection()
        )
        collectionView.register(CustomCollectionViewCell.self,
                                forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collectionView.dataSource = self
        
    }

    private func instagramSection() -> NSCollectionLayoutSection {

        let itemSpacing = CGFloat(2)
        let smallItemLength = (self.view.frame.size.width - (itemSpacing * 2)) / 3
        let largeItemLength = smallItemLength * 2 + itemSpacing
        
        // 小itemが縦に2つ並んだグループ
        let smallItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .absolute(smallItemLength),
                heightDimension: .absolute(smallItemLength)
            )
        )
        let smallItemVerticalGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .absolute(smallItemLength),
                heightDimension: .absolute(largeItemLength)
            ),
            subitem: smallItem,
            count: 2
        )
        smallItemVerticalGroup.interItemSpacing = .fixed(itemSpacing)
        
        // 小itemが縦に2つ並んだグループを横に3つ並べたグループ
        let smallItemsGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(largeItemLength)
            ),
            subitem: smallItemVerticalGroup,
            count: 3
        )
        smallItemsGroup.interItemSpacing = .fixed(itemSpacing)

        // 大item + 小item*2 のグループ
        let largeItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .absolute(largeItemLength),
                heightDimension: .absolute(largeItemLength)
            )
        )

        let largeItemLeftGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(largeItemLength)
            ),
            subitems: [largeItem, smallItemVerticalGroup]
        )
        largeItemLeftGroup.interItemSpacing = .fixed(itemSpacing)
        
        let largeItemRightGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(largeItemLength)
            ),
            subitems: [smallItemVerticalGroup, largeItem]
        )
        largeItemRightGroup.interItemSpacing = .fixed(itemSpacing)

        // 各グループを縦に並べたグループ
        let subitems = [largeItemLeftGroup, smallItemsGroup, largeItemRightGroup, smallItemsGroup]
        let heightDimension = NSCollectionLayoutDimension.absolute(
            //sectionの間隔は50
            largeItemLength * CGFloat(subitems.count) + (itemSpacing * 50)
        )

        // 高さの計算は後に追加するスペース分も足す
        let groups = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: heightDimension),
            subitems: subitems
        )
        groups.interItemSpacing = .fixed(itemSpacing)
        let section = NSCollectionLayoutSection(group: groups)
        section.interGroupSpacing = itemSpacing
        return section

    }
    
}

extension InstagramViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 200
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier,
                                                      for: indexPath) as! CustomCollectionViewCell
        return cell
    }
    
}
