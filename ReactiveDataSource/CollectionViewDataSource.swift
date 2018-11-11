//
//  CollectionViewDataSource.swift
//  DataSource
//
//  Created by Jan Prokeš on 07/11/2018.
//  Copyright © 2018 Jan Prokeš. All rights reserved.
//

import UIKit
import ReactiveSwift

class CollectionDataSource: CommonDataSource<UICollectionView>, UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        container = collectionView
        collectionView.delegate = self
        
        return sections.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections.value[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = sections.value[indexPath.section].items[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: item.cell.reusableIdentifier, for: indexPath)
        
        item.configure(cell)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = sections.value[indexPath.section].items[indexPath.row]
        
        cell.selectAction?.apply(indexPath).start()
    }
}
