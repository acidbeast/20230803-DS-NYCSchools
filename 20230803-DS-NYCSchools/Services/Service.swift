//
//  Service.swift
//  20230803-DS-NYCSchools
//
//  Created by Dmitry Shlepkin on 8/6/23.
//

import Foundation


/*
 If I had more time I woulde like to add Networking library, Moya for example.
 */

protocol ServiceProtocol {
    func getData<T: Codable>(url: URL, completion: @escaping (T?, Error?) -> Void)
}

class Service: ServiceProtocol {
    
    enum ServiceError: String, Error {
        case data = "No data returned from request."
        case url = "URL is incorrect."
    }
    
    internal func getData<T: Codable>(url: URL, completion: @escaping (T?, Error?) -> Void) {
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
}
