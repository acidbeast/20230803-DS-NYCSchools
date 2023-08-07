//
//  SchoolDetailsView+Collection .swift
//  20230803-DS-NYCSchools
//
//  Created by Dmitry Shlepkin on 8/7/23.
//

import UIKit

extension SchoolDetailsView: UICollectionViewDelegate {
    
}

extension SchoolDetailsView: UICollectionViewDataSource {
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sectionsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = sectionsData[indexPath.row]
        switch section.type {
        case .title(let text):
            return createSchoolDetailsTitle(indexPath, text)
        case .text(let text, let lines, let color):
            return createSchoolDetailsText(indexPath, (text, lines, color))
        case .subtitle(let text):
            return createSchoolDetailsSubtitle(indexPath, text)
        case .twoColumns(let text, let value):
            return createSchoolDetailsTwoColumns(indexPath, (text, value))
        }
    }
    
}
    

// MARK: - Create Cells
private extension SchoolDetailsView {
            
    func createSchoolDetailsTitle(
        _ indexPath: IndexPath,
        _ text: String
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SchoolDetailsTitleCollectionViewCell.identifier,
            for: indexPath
        ) as? SchoolDetailsTitleCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.updateWith(title: text)
        return cell
    }
    
    func createSchoolDetailsText(
        _ indexPath: IndexPath,
        _ values: (String, Int, UIColor)
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SchoolDetailsTextCollectionViewCell.identifier,
            for: indexPath
        ) as? SchoolDetailsTextCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.updateWith(values: values)
        return cell
    }
    
    func createSchoolDetailsSubtitle(
        _ indexPath: IndexPath,
        _ text: String
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SchoolDetailsSubtitleCollectionViewCell.identifier,
            for: indexPath
        ) as? SchoolDetailsSubtitleCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.updateWith(title: text)
        return cell
    }
    

    func createSchoolDetailsTwoColumns(
        _ indexPath: IndexPath,
        _ values: (String, String)
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SchoolDetailsTwoColumnsCollectionViewCell.identifier,
            for: indexPath
        ) as? SchoolDetailsTwoColumnsCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.updateWith(values: values)
        return cell
    }
    
    
    
}
