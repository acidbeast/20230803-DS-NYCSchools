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
    }
    
    func setup(navigationTitle: String) {
        setupNavigation(title: navigationTitle)
        setup()
    }
    
    func setupNavigation(title: String) {
        navigationItem.title = title
    }
    
    func setupSchoolsListView() {
        view.addSubview(schoolsListView)
        schoolsListView.pinWithSafeArea(to: view)
    }
    
}
