//
//  Cafe.swift
//  Cafe
//
//  Created by Кирилл  Геллерт on 28.11.2021.
//

import Foundation
import UIKit

class Cafe {
    
    var tables = [Table]()
    
    func chooseTable(_ tableNumber: Int) {
        if let tableIndex = tables.firstIndex(where: { ()
            return $0.number == tableNumber
        }) {
            if tables[tableIndex].status == .isChosen {
                tables[tableIndex].status = .isFree
            } else if tables[tableIndex].status == .isFree {
                tables[tableIndex].status = .isChosen
            } else if tables[tableIndex].status == .isReserved {
                
            }
        }
    }
                                
func makeTableFree() {
                
    }
    
    func addRandomTableStatus(_ tablesCount: Int, _ chosenTables: [Int]) {
        
        for status in Table.Status.allCases {
            var reservedTables = [Table]()
            if var countForRandomCreate = status.parametres.countForRandomCreate  {
                if countForRandomCreate == 0 {
                    countForRandomCreate = tablesCount - tables.count
                }
                while reservedTables.count < countForRandomCreate {
                    let randomIndex = Int.random(in: 0...tablesCount - 1)
                    if !tables.contains(where: {
                        return $0.number == (randomIndex + 1)
                    }), !reservedTables.contains(where: {
                        return $0.number == (randomIndex + 1)
                    }) {
                        reservedTables.append(Table.init(status: status, number: randomIndex + 1))
                    }
                }
                tables += reservedTables
            }
        }
    }
    
    init(tablesCount: Int, chosenTables: [Int]) {
        addRandomTableStatus(tablesCount, chosenTables)
    }
    
}

func isValidEmail(emailID:String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: emailID)
}


