//
//  Section+Item.swift
//  DataSource
//
//  Created by Jan Prokeš on 07/11/2018.
//  Copyright © 2018 Jan Prokeš. All rights reserved.
//

import ReactiveSwift
import Result

class Item<Cell: ReusableView> {
    let cell: ReusableView.Type
    let configure: (Cell) -> Void
    let selectAction: Action<IndexPath, (), AnyError>?
    
    init<Configurable: ReusableView>(cell: Configurable.Type, selectAction: Action<IndexPath, (), AnyError>?, configure: @escaping (Configurable) -> Void) {
        self.cell = cell
        self.configure = { cell in
            guard let configurable = cell as? Configurable else {
                fatalError("Could not cast \(type(of: cell)) to \(Configurable.self), \(#file, #line)")
            }
            
            configure(configurable)
        }
        
        self.selectAction = selectAction
    }
}

struct Section<Cell: ReusableView> {
    let items: [Item<Cell>]
}
