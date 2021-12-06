//
//  TableChooserViewController.swift
//  Cafe
//
//  Created by Кирилл  Геллерт on 02.12.2021.
//

import UIKit

class TableChooserViewController: UIViewController {
    
    @IBOutlet var tablesButtons: [UIButton]!
    
    var chosenTableNumbers : String?
    
    lazy var cafe = Cafe(tablesCount: tablesButtons.count)
    
    func updateViewTables() {
        for table in cafe.tables {
            let tableButton = tablesButtons[table.number - 1]
            tableButton.backgroundColor = table.status.parametres.backColor
            tableButton.setTitle(table.status.parametres.title, for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setChosenTables()
        updateViewTables()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let regVC = presentingViewController as? RegistationViewController {
            DispatchQueue.main.async {
                let chosenTables = self.cafe.tables.filter { $0.status == .isChosen }
                regVC.updateTableNumbers(tables: chosenTables)
            }
        }
    }
    
    @IBAction func tapOnTable(_ sender: UIButton) {
        if let tableNumber = tablesButtons.firstIndex(of: sender) {
            cafe.chooseTable(tableNumber + 1)
        }
        updateViewTables()
    }
    
    func setChosenTables() {
        if let stringChosenNumbers = chosenTableNumbers {
            var chosenTables = [Int]()
            for index in stringChosenNumbers.indices {
                if stringChosenNumbers[index] != ",", stringChosenNumbers[index] != " " {
                    chosenTables.append(Int(String(stringChosenNumbers[index]))!)
                }
            }
            for tableIndex in cafe.tables.indices {
                if chosenTables.contains(where: {return $0 == cafe.tables[tableIndex].number}) {
                    cafe.tables[tableIndex].status = .isChosen
                }
            }
        }
    }
    
}
