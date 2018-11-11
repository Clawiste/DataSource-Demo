//
//  ReusableView.swift
//  DataSource
//
//  Created by Jan Prokeš on 07/11/2018.
//  Copyright © 2018 Jan Prokeš. All rights reserved.
//

import UIKit

protocol ReusableView {
    static var reusableIdentifier: String { get }
}

extension ReusableView {
    static var reusableIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableView { }
extension UICollectionViewCell: ReusableView { }
