//
//  ViewController.swift
//  ReactiveDataSource
//
//  Created by Jan Prokeš on 07/11/2018.
//  Copyright © 2018 Jan Prokeš. All rights reserved.
//

import UIKit
import ReactiveSwift
import Result

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    let dataSource = TableDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let selectAction = Action<IndexPath, (), AnyError> { _ in
            return SignalProducer { observer, _ in
                print("SELECTED")
                
                observer.sendCompleted()
            }
        }
        
        let strings = MutableProperty(["TEXT"])
        dataSource.sections <~ strings.map { strings -> [Section<UITableViewCell>] in
            let items = strings.map { string -> Item<UITableViewCell> in
                TextCellModel(title: string).item(withSelectAction: selectAction)
            }
            
            return [Section(items: items)]
        }
        
        tableView.register(TextCell.self, forCellReuseIdentifier: TextCell.reusableIdentifier)
        tableView.dataSource = dataSource
    }
}
