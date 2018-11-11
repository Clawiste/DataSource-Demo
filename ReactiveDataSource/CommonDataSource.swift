//
//  CommonDataSource.swift
//  DataSource
//
//  Created by Jan Prokeš on 07/11/2018.
//  Copyright © 2018 Jan Prokeš. All rights reserved.
//

import Foundation

import Foundation
import ReactiveSwift

class CommonDataSource<Container: Reloadable>: NSObject {
    let sections: MutableProperty<[Section<Container.Cell>]>
    weak var container: Container?
        
    override convenience init() {
        self.init(sections: MutableProperty([]))
    }
    
    init(sections: MutableProperty<[Section<Container.Cell>]>) {
        self.sections = sections
        
        super.init()
        
        sections.producer
            .startWithValues { [weak self] _ in
                DispatchQueue.main.async {
                    self?.container?.reloadData()
                }
        }
    }
}
