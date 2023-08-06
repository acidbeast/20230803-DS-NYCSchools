//
//  SchoolDetailsVC+Setup.swift
//  20230803-DS-NYCSchools
//
//  Created by Dmitry Shlepkin on 8/5/23.
//

extension SchoolDetailsVC {
    
    func setup() {
        setupSchoolFullView()
    }
    
    func setup(navigationTitle: String) {
        setupNavigation(title: navigationTitle)
        setup()
    }
    
    private func setupNavigation(title: String) {
        navigationItem.title = title
    }
    
    private func setupSchoolFullView() {
        view.addSubview(schoolDetailsView)
        view.backgroundColor = .white
        schoolDetailsView.pinWithSafeArea(to: view)
    }
    
    
}
