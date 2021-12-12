//
//  CheckTableViewController.swift
//  Cafe
//
//  Created by Кирилл  Геллерт on 09.12.2021.
//

import UIKit

class CheckTableViewController: UITableViewController {
    
    @IBOutlet weak var lblVisiterName: UILabel!
    var menu = [Position]()
    var chosenTables : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1...2 {
            menu.append(Position.init(positionNumber: i))
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CheckTableViewCell {
            let position = menu[indexPath.row]
            cell.refresh(position)
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
