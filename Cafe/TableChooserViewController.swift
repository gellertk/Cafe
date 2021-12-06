//
//  TableChooserViewController.swift
//  Cafe
//
//  Created by Кирилл  Геллерт on 02.12.2021.
//

import UIKit

class TableChooserViewController: UIViewController {
    
    @IBOutlet var tablesButtons: [UIButton]!
    
    var chosenTables = [Int]()
    
    lazy var cafe = Cafe(tablesCount: tablesButtons.count, chosenTables: chosenTables)
    
    func updateViewTables() {
        for table in cafe.tables {
            let tableButton = tablesButtons[table.number - 1]
            tableButton.backgroundColor = table.status.parametres.backColor
            tableButton.setTitle(table.status.parametres.title, for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViewTables()
    }
    
    @IBAction func tapOnTable(_ sender: UIButton) {
        if let tableNumber = tablesButtons.firstIndex(of: sender) {
            cafe.chooseTable(tableNumber + 1)
        }
        updateViewTables()
    }
}
