//
//  SchoolDetailsView+Setup.swift
//  20230803-DS-NYCSchools
//
//  Created by Dmitry Shlepkin on 8/5/23.
//

import UIKit

extension SchoolDetailsView {
        
    func setupSchoolFullView() {
        addSubview(schoolFullView)
        schoolFullView.pin(to: self)
    }
    
    func setupLoadingView() {
        addSubview(loadingView)
        loadingView.pin(to: self)
    }
    
    func setupErrorView() {
        addSubview(errorView)
        errorView.pin(to: self)
    }
    
}

