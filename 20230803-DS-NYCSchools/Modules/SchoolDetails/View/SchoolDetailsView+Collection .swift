//
//  SchoolDetailsView+Collection .swift
//  20230803-DS-NYCSchools
//
//  Created by Dmitry Shlepkin on 8/7/23.
//

import UIKit

extension SchoolDetailsView: UICollectionViewDelegate {}

extension SchoolDetailsView: UICollectionViewDataSource {
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sectionsData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = sectionsData[indexPath.row]
        switch section.type {
        case .title(let text):
            return createSchoolDetailsTitle(indexPath, text)
        case .text(let label, let text, let lines, let color, let topSpace):
            return createSchoolDetailsText(indexPath, (label, text, lines, color, topSpace))
        case .subtitle(let text):
            return createSchoolDetailsSubtitle(indexPath, text)
        case .twoColumns(let text, let value, let background):
            return createSchoolDetailsTwoColumns(indexPath, (text, value, background))
        case .separator:
            return createSchoolDetailsSeparator(indexPath)
        }
    }
    
}
    
// MARK: - Create Cells
private extension SchoolDetailsView {
       
    private func createCell(
        _ identifier: String,
        _ indexPath: IndexPath
    ) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(
            withReuseIdentifier: identifier,
            for: indexPath
        )
    }
    
    private func createSchoolDetailsTitle(
        _ indexPath: IndexPath,
        _ text: String
    ) -> UICollectionViewCell {
        guard let cell = createCell(
            SchoolDetailsTitleCollectionViewCell.identifier,
            indexPath
        ) as? SchoolDetailsTitleCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.updateWith(title: text)
        return cell
    }
    
    private func createSchoolDetailsText(
        _ indexPath: IndexPath,
        _ values: (String, String, Int, UIColor, Double)
    ) -> UICollectionViewCell {
        guard let cell = createCell(
            SchoolDetailsTextCollectionViewCell.identifier,
            indexPath
        ) as? SchoolDetailsTextCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.updateWith(values: values)
        return cell
    }
    
    private func createSchoolDetailsSubtitle(
        _ indexPath: IndexPath,
        _ text: String
    ) -> UICollectionViewCell {
        guard let cell = createCell(
            SchoolDetailsSubtitleCollectionViewCell.identifier,
            indexPath
        ) as? SchoolDetailsSubtitleCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.updateWith(title: text)
        return cell
    }
    
    private func createSchoolDetailsTwoColumns(
        _ indexPath: IndexPath,
        _ values: (String, String, Bool)
    ) -> UICollectionViewCell {
        guard let cell = createCell(
            SchoolDetailsTwoColumnsCollectionViewCell.identifier,
            indexPath
        ) as? SchoolDetailsTwoColumnsCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.updateWith(values: values)
        return cell
    }
    
    private func createSchoolDetailsSeparator(_ indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = createCell(
            SchoolDetailsSeparatorCollectionViewCell.identifier,
            indexPath
        ) as? SchoolDetailsSeparatorCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
}
