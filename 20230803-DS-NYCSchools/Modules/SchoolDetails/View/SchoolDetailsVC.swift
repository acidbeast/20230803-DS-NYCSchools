//
//  SchoolDetailsVC.swift
//  20230803-DS-NYCSchools
//
//  Created by Dmitry Shlepkin on 8/5/23.
//

import UIKit

final class SchoolDetailsVC: UIViewController {
    
    var viewModel: SchoolDetailsVMProtocol
    var router: MainRouterProtocol
    var schoolDetailsView = SchoolDetailsView()
    
    init(
        router: MainRouterProtocol,
        viewModel: SchoolDetailsVMProtocol
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
        setUpdateViewHander() 
        viewModel.getData()
    }
    
}

private extension SchoolDetailsVC {
    
    func setUpdateViewHander() {
        viewModel.updateViewData = { viewData in
            DispatchQueue.main.async { [weak self, viewData] in
                self?.schoolDetailsView.viewData = viewData
            }
        }
    }
    
}
