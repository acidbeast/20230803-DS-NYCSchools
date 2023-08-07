//
//  Temp.swift
//  20230803-DS-NYCSchools
//
//  Created by Dmitry Shlepkin on 8/7/23.
//

import UIKit
//
//class TableViewController: UITableViewController, UISearchResultsUpdating {
//    
//    let tableData = ["Austria","Australia","Srilanka","Japan"]
//    var filteredTableData = [String]()
//    var resultSearchController = UISearchController()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.resultSearchController = ({
//            let controller = UISearchController(searchResultsController: nil)
//            controller.searchResultsUpdater = self
//            controller.dimsBackgroundDuringPresentation = false
//            controller.searchBar.sizeToFit()
//            self.tableView.tableHeaderView = controller.searchBar
//            return controller
//        })()
//
//        // Reload the table
//        self.tableView.reloadData()
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 1
//    }
//    
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if (self.resultSearchController.active) {
//            return self.filteredTableData.count
//        }
//        else {
//            return self.tableData.count
//        }
//    }
//
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//            let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
//            if (self.resultSearchController.active) {
//                cell.textLabel?.text = filteredTableData[indexPath.row]
//                return cell
//            }
//            else {
//                cell.textLabel?.text = tableData[indexPath.row]
//                return cell
//            }
//    }
//
//    func updateSearchResultsForSearchController(searchController: UISearchController) {
//        filteredTableData.removeAll(keepCapacity: false)
//        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
//        let array = (tableDataasNSArray).filteredArrayUsingPredicate(searchPredicate)
//        filteredTableData = array as! [String]
//        self.tableView.reloadData()
//    }
//    
//}
