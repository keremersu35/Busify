//
//  TicketsViewController.swift
//  Busify
//
//  Created by Kerem Ersu on 3.04.2023.
//

import UIKit

class TicketsViewController: UIViewController {

    @IBOutlet weak var ticketsTableView: UITableView!
    var ticketInfo = [String: String]()
    var ticketList = [TicketCellModel]()
    var previousIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        ticketList = self.setTicketList(ticketInfo)
        configureTableView()
    }
}

extension TicketsViewController {
    
    func configureTableView() {
        
        ticketsTableView.delegate = self
        ticketsTableView.dataSource = self
        ticketsTableView.register(UINib(nibName: Constants.NibNames.ticketCell.rawValue, bundle: nil), forCellReuseIdentifier: Constants.NibNames.ticketCell.rawValue)
    }
}

extension TicketsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ticketList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.NibNames.ticketCell.rawValue, for: indexPath) as! TicketCell
        cell.setup(ticketList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        ticketList[indexPath.row].isHidden.toggle()
        if (previousIndex != -1) {
            ticketList[previousIndex].isHidden = true
            tableView.reloadRows(at: [IndexPath(row: previousIndex, section: 0), indexPath], with: .automatic)
        } else {
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        tableView.beginUpdates()
        tableView.endUpdates()

        previousIndex = indexPath.row
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        ticketList[indexPath.row].isHidden ? 150.0 : 390.0
    }
}
