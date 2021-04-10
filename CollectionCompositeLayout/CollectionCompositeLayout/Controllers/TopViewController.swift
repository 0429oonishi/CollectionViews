//
//  TopViewController.swift
//  CollectionCompositeLayout
//
//  Created by 大西玲音 on 2021/04/09.
//

import UIKit

final class TopViewController: UIViewController {

    @IBAction private func gridButtonDidTapped(_ sender: Any) {
        let gridVC = UIStoryboard(name: "Grid", bundle: nil).instantiateViewController(identifier: "GridViewController") as! GridViewController
        present(gridVC, animated: true, completion: nil)
    }
    
    @IBAction private func instagramButtonDidTapped(_ sender: Any) {
        let instagramVC = UIStoryboard(name: "Instagram", bundle: nil).instantiateViewController(identifier: "InstagramViewController") as! InstagramViewController
        present(instagramVC, animated: true, completion: nil)
    }
    
}

