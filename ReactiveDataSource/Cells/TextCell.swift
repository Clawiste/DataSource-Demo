//
//  TextCell.swift
//  DataSource
//
//  Created by Jan Prokeš on 07/11/2018.
//  Copyright © 2018 Jan Prokeš. All rights reserved.
//

import UIKit

struct TextCellModel: ConfigurableModel {
    typealias Cell = TextCell
    
    let title: String
    
    func configure(cell: TextCell) {
        cell.textLabel?.text = title
    }
}

class TextCell: UITableViewCell {

}
