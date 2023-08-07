//
//  SchoolsService.swift
//  20230803-DS-NYCSchools
//
//  Created by Dmitry Shlepkin on 8/5/23.
//

import Foundation

protocol SchoolsServiceProtocol {
    var schoolsList: SchoolsList? { get set }
    func getSchools(completion: @escaping (SchoolsList?, Error?) -> Void)
    func getSchool(dbn: String) -> School?
    func getSchoolsSorted(by name: String) -> SchoolsList? 
}

final class SchoolsService: Service, SchoolsServiceProtocol {
    
    var schoolsList: SchoolsList?
    
    /*
     This data looks like it get updated not so often
     If I had more time, I will add Core Data here and cache schools.
     */
    func getSchools(completion: @escaping (SchoolsList?, Error?) -> Void) {
        guard let url = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json") else {
            completion(nil, ServiceError.url)
            return
        }
        if let schoolsList = schoolsList {
            completion(schoolsList, nil)
        } else {
            getData(url: url) { [weak self] schools, error in
                self?.schoolsList = schools
                completion(schools, error)
            }
        }
    }
    
    func getSchool(dbn: String) -> School? {
        return schoolsList?.filter{ $0.dbn == dbn }.first
    }
    
    func getSchoolsSorted(by name: String) -> SchoolsList? {
        schoolsList?.filter { $0.schoolName.lowercased().contains(name.lowercased()) }
    }
    
}
