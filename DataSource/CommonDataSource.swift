//
//  CommonDataSource.swift
//  DataSource
//
//  Created by Jan Prokeš on 07/11/2018.
//  Copyright © 2018 Jan Prokeš. All rights reserved.
//

import Foundation

class CommonDataSource<Container: Reloadable>: NSObject {
    var sections: [Section<Container.Cell>] {
        didSet {
            DispatchQueue.main.async {
                self.container?.reloadData()
            }
        }
    }
    
    weak var container: Container?
    
    override convenience init() {
        self.init(sections: [])
    }
    
    init(sections: [Section<Container.Cell>]) {
        self.sections = sections
        
        super.init()
    }
}
