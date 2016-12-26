//
//  ViewController.swift
//  ExpandableCellsExample
//
//  Created by DC on 28.08.2016.
//  Copyright © 2016 Dawid Cedrych. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.estimatedRowHeight = 2.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.tableFooterView = UIView()
    }


    // TableView DataSource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ExpandableCell = tableView.dequeueReusableCell(withIdentifier: "ExpandableCell") as! ExpandableCell
        cell.img.image = UIImage(named: indexPath.row.description)
        cell.isExpanded = false
        return cell
    }
    
    // TableView Delegate methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let cell = tableView.cellForRow(at: indexPath) as? ExpandableCell
            else { return }
        
            UIView.animate(withDuration: 0.3, animations: {
                tableView.beginUpdates()
                cell.isExpanded = !cell.isExpanded
                tableView.scrollToRow(at: indexPath, at: UITableViewScrollPosition.top, animated: true)
                tableView.endUpdates()
                
            })
            
        }
    
    

    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? ExpandableCell
            else { return }
        UIView.animate(withDuration: 0.3, animations: {
            tableView.beginUpdates()
            cell.isExpanded = false
            tableView.endUpdates()
        })
    }
}

