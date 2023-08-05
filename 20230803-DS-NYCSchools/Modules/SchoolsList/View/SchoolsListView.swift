//
//  SchoolsListView.swift
//  20230803-DS-NYCSchools
//
//  Created by Dmitry Shlepkin on 8/5/23.
//

import UIKit

final class SchoolsListView: UIView {
    
    var viewData: SchoolsListViewData = .initial {
        didSet {
            setNeedsLayout()
        }
    }
    var cellsData = [SchoolsListCellVM]()
    var onSelect: ((String) -> Void)?
    
    lazy var loadingView = LoadingView()
    lazy var emptyView = EmptyView()
    lazy var errorView = ErrorView()
    lazy var tableView = UITableView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        update(data: viewData)
    }
    
    private func update(data: SchoolsListViewData) {
        subviews.forEach { $0.removeFromSuperview() }
        switch viewData {
        case .initial:
            break
        case .loading(let loading):
            setupLoadingView()
            loadingView.updateWith(title: loading.title, description: loading.description)
            loadingView.playAnimation()
            break
        case .empty(let empty):
            setupEmptyView()
            emptyView.updateWith(title: empty.title, description: empty.description)
            break
        case .error(let error):
            setupErrorView()
            errorView.updateWith(title: error.title)
            break
        case .success(let success):
            cellsData = success.schools ?? []
            setupTableView()
            break
        }
    }
    
}
