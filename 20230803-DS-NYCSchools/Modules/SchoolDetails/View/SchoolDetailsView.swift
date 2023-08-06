//
//  SchoolDetailsView.swift
//  20230803-DS-NYCSchools
//
//  Created by Dmitry Shlepkin on 8/5/23.
//

import UIKit

final class SchoolDetailsView: UIView {
    
    var viewData: SchoolDetailsViewData = .initial {
        didSet {
            setNeedsLayout()
        }
    }
    
    lazy var schoolFullView = SchoolFullView()
    lazy var loadingView = LoadingView()
    lazy var errorView = ErrorView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        update(viewData: viewData)
    }
    
    private func update(viewData: SchoolDetailsViewData) {
        subviews.forEach { $0.removeFromSuperview() }
        switch viewData {
        case .initial:
            break
        case .loading:
            setupLoadingView()
            loadingView.playAnimation()
            break
        case .error(let error):
            setupErrorView()
            errorView.updateWith (title: error.title) {
                print("Action")
            }
            break
        case .success(let success):
            setupSchoolFullView()
            schoolFullView.updateWith(
                title: success.title,
                text: success.description
            )
            break
        }
    }
    
}
