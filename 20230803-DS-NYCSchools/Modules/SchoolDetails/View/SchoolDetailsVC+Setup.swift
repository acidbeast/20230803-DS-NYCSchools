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
        navigationController?.isNavigationBarHidden = false
        navigationItem.title = title
    }
    
    private func setupSchoolFullView() {
        view.addSubview(schoolDetailsView)
        view.backgroundColor = .white
        schoolDetailsView.pinWithSafeArea(to: view)
        schoolDetailsView.errorAction = { [weak self] in
            self?.router.goBack()
        }
        schoolDetailsView.linkAction = { [weak self] urlString in
            self?.router.showWebView(urlString: urlString)
        }
    }
    
    
}
