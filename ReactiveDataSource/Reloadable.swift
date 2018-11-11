//
//  Reloadable.swift
//  DataSource
//
//  Created by Jan Prokeš on 07/11/2018.
//  Copyright © 2018 Jan Prokeš. All rights reserved.
//

import UIKit

protocol Reloadable: class {
    associatedtype Cell: ReusableView
    
    func reloadData()
}

extension UICollectionView: Reloadable {
    typealias Cell = UICollectionViewCell
}

extension UITableView: Reloadable {
    typealias Cell = UITableViewCell
}
