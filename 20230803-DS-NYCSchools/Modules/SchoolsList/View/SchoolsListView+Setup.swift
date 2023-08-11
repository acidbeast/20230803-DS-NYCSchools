//
//  SchoolsListView+Setup.swift
//  20230803-DS-NYCSchools
//
//  Created by Dmitry Shlepkin on 8/5/23.
//

import UIKit

extension SchoolsListView {
    
    func setup() {
        backgroundColor = .white
    }
    
    func setupTableView() {
        addSubview(tableView)
        tableView.pin(to: self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100.0
        tableView.backgroundColor = .white
        tableView.register(
            SchoolListTableViewCell.self,
            forCellReuseIdentifier: SchoolListTableViewCell.identifier
        )
        tableView.reloadData()
    }
    
    func setupLoadingView() {
        addSubview(loadingView)
        loadingView.pin(to: self)
    }
    
    func setupEmptyView() {
        addSubview(emptyView)
        emptyView.pin(to: self)
    }
    
    func setupErrorView() {
        addSubview(errorView)
        errorView.pin(to: self)
    }
    
}
