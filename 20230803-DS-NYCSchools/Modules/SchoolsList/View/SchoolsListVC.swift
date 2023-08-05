//
//  SchoolsListVC.swift
//  20230803-DS-NYCSchools
//
//  Created by Dmitry Shlepkin on 8/5/23.
//

import UIKit


final class SchoolsListVC: UIViewController {
    
    var router: MainRouterProtocol
    var viewModel: SchoolsListVMProtocol
    var schoolsListView = SchoolsListView()
    
    init(
        router: MainRouterProtocol,
        viewModel: SchoolsListVMProtocol
    ) {
        self.router = router
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup(navigationTitle: viewModel.navigationTitle)
        setUpdateViewHandler()
        setViewOnSelectHandler()
        viewModel.getSchools()
    }
    
    private func setUpdateViewHandler() {
        viewModel.updateViewData = { viewData in
            DispatchQueue.main.async { [weak self, viewData] in
                self?.schoolsListView.viewData = viewData
            }
        }
    }
    
    private func setViewOnSelectHandler() {
        schoolsListView.onSelect = { [weak self] postId in
            // Go to school details screen
        }
    }
    
}
