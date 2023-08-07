//
//  SatService.swift
//  20230803-DS-NYCSchools
//
//  Created by Dmitry Shlepkin on 8/6/23.
//

import Foundation

protocol SatServiceProtocol {
    func getSatResults(dbn: String, completion: @escaping (SatResultList?, Error?) -> Void)
}

final class SatService: Service, SatServiceProtocol {
        
    func getSatResults(dbn: String, completion: @escaping (SatResultList?, Error?) -> Void) {
        guard let url = URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json?dbn=\(dbn)") else {
            completion(nil, ServiceError.url)
            return
        }
        getData(url: url, completion: completion)
    }
    
}
