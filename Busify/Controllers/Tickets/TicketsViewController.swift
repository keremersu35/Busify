//
//  TicketsViewController.swift
//  Busify
//
//  Created by Kerem Ersu on 3.04.2023.
//

import UIKit

class TicketsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var ticketsTableView: UITableView!
    var list = ["","","","","","","","",""]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ticketsTableView.delegate = self
        ticketsTableView.dataSource = self
        ticketsTableView.rowHeight = UITableView.automaticDimension
        ticketsTableView.reloadData()
        
        ticketsTableView.register(UINib(nibName: Constants.NibNames.ticketCell.rawValue, bundle: nil), forCellReuseIdentifier: Constants.NibNames.ticketCell.rawValue)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.NibNames.ticketCell.rawValue, for: indexPath) as! TicketCell
        if(list[indexPath.row] == "1") {
            cell.seatView.isHidden = false
        }
        cell.setup()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        list[indexPath.row] = "1"
        tableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
    }
}

