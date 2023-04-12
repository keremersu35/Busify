//
//  MyTicketsViewController.swift
//  Busify
//
//  Created by Kerem Ersu on 9.04.2023.
//

import UIKit

class MyTicketsViewController: UIViewController {
    
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var tableView: UITableView!
    var ticketList = [TicketModel]()
    
    override func viewWillAppear(_ animated: Bool) {
        if let retrievedTicketDataArray = UserDefaults.standard.array(forKey: Constants.UserDefaultsKeys.ticketData.rawValue) as? [Data] {
            let decoder = JSONDecoder()
            for ticketData in retrievedTicketDataArray {
                if let ticketModel = try? decoder.decode(TicketModel.self, from: ticketData) {
                    ticketList.append(ticketModel)
                }
            }
        } else {
            print("Ticket Data not found in UserDefaults")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
    }
}

extension MyTicketsViewController {
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: Constants.NibNames.myTicketCell.rawValue, bundle: nil), forCellReuseIdentifier: Constants.NibNames.myTicketCell.rawValue)
    }
}

extension MyTicketsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ticketList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.NibNames.myTicketCell.rawValue, for: indexPath) as! MyTicketCell
        cell.setup(ticketList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        190.0
    }
}
