//
//  SchoolsService.swift
//  20230803-DS-NYCSchools
//
//  Created by Dmitry Shlepkin on 8/5/23.
//

import Foundation

protocol SchoolsServiceProtocol {
    func getSchools(completion: @escaping (SchoolsList?, Error?) -> Void)
}

final class SchoolsService: SchoolsServiceProtocol {

    enum ServiceError: String, Error {
        case data = "No data returned from request."
        case url = "URL is incorrect."
    }
    
    private func getData<T: Codable>(url: URL, completion: @escaping (T?, Error?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion(nil, ServiceError.data)
                return
            }
            do {
                let data = try JSONDecoder().decode(T.self, from: data)
                completion(data, error)
            } catch {
                completion(nil, error)
            }
        }
        task.resume()
    }
    
    func getSchools(completion: @escaping (SchoolsList?, Error?) -> Void) {
        guard let url = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json") else {
            completion(nil, ServiceError.url)
            return
        }
        getData(url: url, completion: completion)
    }
    
}
