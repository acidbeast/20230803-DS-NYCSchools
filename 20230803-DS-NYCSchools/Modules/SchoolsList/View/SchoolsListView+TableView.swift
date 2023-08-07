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
            onSelect(cellVM.dbn)
        }
    }
}

extension SchoolsListView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {            
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: SchoolListTableViewCell.identifier) as? SchoolListTableViewCell else {
            return UITableViewCell()
        }
        let cellViewModel = cellsData[indexPath.row]
        cell.configure(
            title: cellViewModel.title,
            address: cellViewModel.address,
            neighborhood: cellViewModel.neighborhood,
            phone: cellViewModel.phoneNumber
        )
        cell.selectionStyle = .none
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
}
