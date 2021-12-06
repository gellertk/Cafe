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
        if let newVC = storyboard?.instantiateViewController(withIdentifier: "tableChooserVC") {
            present(newVC, animated: true, completion: nil)
        }
    }

}
