//
//  SchoolsListView+TableView.swift
//  20230803-DS-NYCSchools
//
//  Created by Dmitry Shlepkin on 8/5/23.
//

import UIKit

extension SchoolsListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellVM = cellsData[indexPath.row]
        if let onSelect = onSelect {
            onSelect("Pass item id here")
        }
    }
}

extension SchoolsListView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let cellVM = cellsData[indexPath.row]
        cell.textLabel?.text = cellVM.title
        return cell
    }
    
}
