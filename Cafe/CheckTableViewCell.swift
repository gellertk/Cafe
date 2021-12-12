//
//  CheckTableViewCell.swift
//  Cafe
//
//  Created by Кирилл  Геллерт on 09.12.2021.
//

import UIKit

class CheckTableViewCell: UITableViewCell {

    @IBOutlet weak var lblPositionName: UILabel!
    @IBOutlet weak var lblIngridients: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func refresh(_ position: Position) {
        lblPositionName.text = position.name
        lblIngridients.text = position.ingridients
        lblPrice.text = String(position.price)
    }

}
