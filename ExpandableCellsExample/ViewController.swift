//
//  ViewController.swift
//  ExpandableCellsExample
//
//  Created by DC on 28.08.2016.
//  Copyright © 2016 Dawid Cedrych. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let imgs = ["0", "1", "2", "0", "1", "2", "0", "1", "2", "0", "1", "2", "0", "1", "2", "0", "1", "2", "0", "1", "2"]
    
    var expandedRows = Set<Int>()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.estimatedRowHeight = 2.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
//        self.tableView.tableFooterView = UIView()
    }


    // TableView DataSource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 21
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ExpandableCell = tableView.dequeueReusableCell(withIdentifier: "ExpandableCell") as! ExpandableCell
        cell.img.image = UIImage(named: imgs[indexPath.row])
        cell.isExpanded = self.expandedRows.contains(indexPath.row)
        return cell
    }
    
    // TableView Delegate methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        guard let cell = tableView.cellForRow(at: indexPath) as? ExpandableCell
            else { return }
        
//            UIView.animate(withDuration: 0.3, animations: {
//                let offset: CGPoint = self.tableView.contentOffset
        
                tableView.beginUpdates()
//                cell.isExpanded = !cell.isExpanded
                
                if self.expandedRows.contains(indexPath.row) {
                    self.expandedRows.remove(indexPath.row)
                    cell.isExpanded = false
                } else {
                    self.expandedRows.insert(indexPath.row)
                    cell.isExpanded = true
                }
                
//                self.tableView.layer.removeAllAnimations()
//                self.tableView.setContentOffset(offset, animated: false)
//                tableView.scrollToRow(at: indexPath, at: UITableViewScrollPosition.top, animated: true)
                tableView.endUpdates()
               
                
                
//            })
//            
        }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? ExpandableCell
            else { return }
//        UIView.animate(withDuration: 0.3, animations: {
//            tableView.beginUpdates()
//            cell.isExpanded = false
//            tableView.endUpdates()
//        })
    }
}

