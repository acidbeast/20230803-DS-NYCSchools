//
//  SchoolsListVC+Setup.swift
//  20230803-DS-NYCSchools
//
//  Created by Dmitry Shlepkin on 8/5/23.
//

extension SchoolsListVC {
    
    func setup() {
        view.backgroundColor = .white
        setupSchoolsListView()
        setupSearchController()
    }
    
    func setup(navigationTitle: String) {
        setupNavigation(title: navigationTitle)
        setup()
    }
    
    func setupNavigation(title: String) {
        navigationItem.title = title
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    func setupSearchController() {
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.sizeToFit()
        searchController.searchBar.placeholder = "Search school by name"
        navigationItem.searchController = searchController
    }
    
    
    func setupSchoolsListView() {
        view.addSubview(schoolsListView)
        schoolsListView.pinWithSafeArea(to: view)
    }
    
}
