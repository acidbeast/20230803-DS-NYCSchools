//
//  SchoolsListVC+Search.swift
//  20230803-DS-NYCSchools
//
//  Created by Dmitry Shlepkin on 8/7/23.
//

import UIKit

extension SchoolsListVC: UISearchResultsUpdating {
        
    func updateSearchResults(for searchController: UISearchController) {
        debouncer.debounce { [weak self] in
            guard let text = self?.searchController.searchBar.text else { return }
            if text.count >= 3 {
                self?.viewModel.getSchoolsSorted(by: text)
            } else {
                self?.viewModel.getSchools()
            }
        }
    }
        
}

extension SchoolsListVC: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.viewModel.getSchools()
    }
    
}


