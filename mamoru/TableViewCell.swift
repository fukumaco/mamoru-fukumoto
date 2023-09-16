//
//  TableViewCell.swift
//  mamoru
//
//  Created by Fukumoto Asako on 2023/09/16.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var checkButton: UISwitch!
    
    @IBOutlet weak var ToDoList: UITextField!
    
    
    @IBOutlet weak var Time: UITextField!
    
    @IBOutlet weak var deadLine: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
