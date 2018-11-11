//
//  ViewController.swift
//  DataSource
//
//  Created by Jan Prokeš on 07/11/2018.
//  Copyright © 2018 Jan Prokeš. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let dataSource = TableDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource.sections = [Section(items: [
            TextCellModel(title: "TEXT").item(withSelectAction: { _ in print("SELECTED") })
        ])]

        tableView.register(TextCell.self, forCellReuseIdentifier: TextCell.reusableIdentifier)
        tableView.dataSource = dataSource
    }
}
