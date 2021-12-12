//
//  File.swift
//  Cafe
//
//  Created by Кирилл  Геллерт on 09.12.2021.
//

import Foundation

struct Position {
    
    var name: String
    var ingridients: String
    var price: Double
    
    init(positionNumber: Int) {
        switch positionNumber {
        case 1:
            self.name = "Котлетки с пюрешкой"
            self.ingridients = "Мясо курицы, лук, соль, масло"
            self.price = 150
        case 2:
            self.name = "Салат Цезарь"
            self.ingridients = "Помидор, салат айсберг, сухарики, курица"
            self.price = 100
        default:
            self.name = "Такой позиции еще нет"
            self.ingridients = ""
            self.price = 0
        }
    }
    
}
