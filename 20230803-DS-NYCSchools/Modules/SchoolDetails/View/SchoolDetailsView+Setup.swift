//
//  SchoolDetailsView+Setup.swift
//  20230803-DS-NYCSchools
//
//  Created by Dmitry Shlepkin on 8/5/23.
//

import UIKit

extension SchoolDetailsView {
        

    private func setupCollectionLayout() -> UICollectionViewCompositionalLayout {
        let layoutConfiguration = UICollectionViewCompositionalLayoutConfiguration()
        layoutConfiguration.interSectionSpacing = 16
        layoutConfiguration.scrollDirection = .vertical
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .plain)
        listConfiguration.showsSeparators = false
        listConfiguration.backgroundColor = .white
        let layout = UICollectionViewCompositionalLayout.list(using: listConfiguration)
        layout.configuration = layoutConfiguration
        return layout
    }
    
    func setupCollectionView() {
        let layout = setupCollectionLayout()
        collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        addSubview(collectionView)
        collectionView
            .pin(to: self, withInsets: .init(top: 0, left: 16, bottom: 0, right: 16))
        registerCells()
        collectionView.reloadData()
    }
        
    private func registerCells() {
        registerCell(with: SchoolDetailsTitleCollectionViewCell.self)
        registerCell(with: SchoolDetailsTextCollectionViewCell.self)
        registerCell(with: SchoolDetailsSubtitleCollectionViewCell.self)
        registerCell(with: SchoolDetailsTwoColumnsCollectionViewCell.self)
        registerCell(with: SchoolDetailsMapCollectionViewCell.self)
    }
    
    private func registerCell(with cellClass: AnyClass) {
        let identifier = String(describing: cellClass.self)
        collectionView.register(cellClass.self, forCellWithReuseIdentifier: identifier)
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

