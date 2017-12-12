//
//  ViewController.swift
//  waterfallFlowLayout
//
//  Created by hanlong_liang on 2017/12/12.
//  Copyright © 2017年 kolamama. All rights reserved.
//

import UIKit

private let kEdgeMargin : CGFloat = 8
private let kContentId = "kContentId"

class ViewController: UIViewController {
    
    fileprivate lazy var conllectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cols : CGFloat = 3
        let itemWH = (self.view.bounds.size.width-(cols+1)*kEdgeMargin)/cols
        layout.itemSize = CGSize.init(width: itemWH, height: itemWH)
        layout.minimumInteritemSpacing = kEdgeMargin
        layout.minimumLineSpacing = kEdgeMargin
        layout.sectionInset = UIEdgeInsetsMake(kEdgeMargin, kEdgeMargin, kEdgeMargin, kEdgeMargin)
        // self. 闭包不会对这里强引用
        let conllectionView = UICollectionView.init(frame: self.view.bounds, collectionViewLayout: layout)
        conllectionView.dataSource = self
        
        return conllectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.addSubview(conllectionView)
        conllectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kContentId)
    }

}

extension ViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kContentId, for: indexPath)
        cell.backgroundColor = .red
        return cell
        
    }
}

