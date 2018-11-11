//
//  CollectionViewDataSource.swift
//  DataSource
//
//  Created by Jan Prokeš on 07/11/2018.
//  Copyright © 2018 Jan Prokeš. All rights reserved.
//

import UIKit

class CollectionDataSource: CommonDataSource<UICollectionView>, UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        container = collectionView
        collectionView.delegate = self
        
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = sections[indexPath.section].items[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: item.cell.reusableIdentifier, for: indexPath)
        
        item.configure(cell)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = sections[indexPath.section].items[indexPath.row]
        
        cell.selectAction(indexPath)
    }
}

