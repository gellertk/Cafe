//
//  RegistationViewController.swift
//  Cafe
//
//  Created by Кирилл  Геллерт on 28.11.2021.
//

import UIKit

class RegistationViewController: UIViewController {
    
    @IBOutlet weak var txtFIO: UITextField!
    @IBOutlet weak var txtGuestCount: UITextField!
    @IBOutlet weak var txtTableNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for case let textField as UITextField in self.view.subviews {
            textField.addOnlyBottomBorder()
        }
    }
    
    @IBAction func showTables(_ sender: UITextField) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                guard let secondViewController = storyboard.instantiateViewController(identifier: "tableChooserVC") as? TableChooserViewController else { return }
        if let chosenTableNumbers = txtTableNumber.text {
            secondViewController.chosenTableNumbers = chosenTableNumbers
        }
        present(secondViewController, animated: true, completion: nil)
    }
    
    func updateTableNumbers(tables: [Table]) {
        txtTableNumber.text = ""
        if let tableNumber = tables.first?.number, tables.count == 1 {
            txtTableNumber.text = String(tableNumber)
        } else {
            for index in tables.indices {
                if tables[index] != tables.last {
                    txtTableNumber.text! += String(tables[index].number) + ", "
                } else {
                    txtTableNumber.text! += String(tables[index].number)
                }
            }
        }
    }
}
