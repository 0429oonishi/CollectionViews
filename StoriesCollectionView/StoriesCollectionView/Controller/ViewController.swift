//
//  ViewController.swift
//  StoriesCollectionView
//
//  Created by 大西玲音 on 2021/04/08.
//

import UIKit

final class ViewController: UIViewController {
    
    private var collectionView: UICollectionView?
    private var models = [Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 1...5 {
            models.append(Model(imageName: "ピチュー"))
            models.append(Model(imageName: "ピカチュウ"))
            models.append(Model(imageName: "ライチュウ"))
        }
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 150, height: 150)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.register(CircleCollectionViewCell.self, forCellWithReuseIdentifier: CircleCollectionViewCell.id)
        collectionView?.backgroundColor = .white
        guard let myCollectionView = collectionView else { return }
        view.addSubview(myCollectionView)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        collectionView?.frame = CGRect(x: 0, y: 100, width: self.view.frame.size.width, height: 150).integral
        
    }


}

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CircleCollectionViewCell.id, for: indexPath) as! CircleCollectionViewCell
        let model = models[indexPath.row]
        cell.configure(model: model)
        return cell
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
}
