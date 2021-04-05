//
//  ViewController.swift
//  HeaderFooterCollectionView
//
//  Created by 大西玲音 on 2021/04/05.
//

import UIKit

final class ViewController: UIViewController {

    private var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: self.view.frame.size.width / 2.2,
                                 height: self.view.frame.size.width / 2.2)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.register(MyCollectionViewCell.nib(),
                                 forCellWithReuseIdentifier: MyCollectionViewCell.id)
        collectionView?.register(HeaderCollectionReusableView.self,
                                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                 withReuseIdentifier: HeaderCollectionReusableView.id)
        collectionView?.register(FooterCollectionReusableView.self,
                                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                                 withReuseIdentifier: FooterCollectionReusableView.id)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = .white
        view.addSubview(collectionView!)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame = self.view.bounds
    }


}

extension ViewController: UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.id, for: indexPath) as! MyCollectionViewCell
        cell.configure()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionFooter {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter,
                                                                         withReuseIdentifier: FooterCollectionReusableView.id,
                                                                         for: indexPath) as! FooterCollectionReusableView
            footer.configure()
            return footer
        } else {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                                         withReuseIdentifier: HeaderCollectionReusableView.id,
                                                                         for: indexPath) as! HeaderCollectionReusableView
            header.configure()
            return header
        }
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 200)
    }
    
}
