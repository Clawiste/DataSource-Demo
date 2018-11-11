//
//  ConfigurableModel.swift
//  DataSource
//
//  Created by Jan Prokeš on 07/11/2018.
//  Copyright © 2018 Jan Prokeš. All rights reserved.
//

import Foundation
import ReactiveSwift
import Result

protocol ConfigurableModel {
    associatedtype Cell: ReusableView
    
    func configure(cell: Cell)
    func item<Reusable: ReusableView>(withSelectAction action: Action<IndexPath, (), AnyError>?) -> Item<Reusable>
}

extension ConfigurableModel {
    func item<Reusable: ReusableView>(withSelectAction action: Action<IndexPath, (), AnyError>? = nil) -> Item<Reusable> {
        return Item(cell: Cell.self, selectAction: action) { cell in
            self.configure(cell: cell)
        }
    }
}
