//
//  ConfigurableModel.swift
//  DataSource
//
//  Created by Jan Prokeš on 07/11/2018.
//  Copyright © 2018 Jan Prokeš. All rights reserved.
//

import Foundation

protocol ConfigurableModel {
    associatedtype Cell: ReusableView
    
    func configure(cell: Cell)
    func item<Reusable: ReusableView>(withSelectAction action: @escaping (IndexPath) -> Void) -> Item<Reusable>
}

extension ConfigurableModel {
    func item<Reusable: ReusableView>(withSelectAction action: @escaping (IndexPath) -> Void = { _ in }) -> Item<Reusable> {
        return Item(cell: Cell.self, selectAction: action) { cell in
            self.configure(cell: cell)
        }
    }
}
