//
//  NetworkService.swift
//  baseFamework
//
//  Created by Tami Yalon on 29/05/2021.
//  Copyright © 2021 Tami yallon. All rights reserved.
//

import Foundation

public class NetworkService: NSObject {
    
    public static let shared = NetworkService()
    
    public func fetchData(from apiPath: ApiPath, maxRedirections: Int, completion: @escaping (Result<[String: String], GFError>) -> Void) {
      
        let urlString = ApiPath.baseUrl.rawValue + apiPath.rawValue
        
        // check the URL is OK, otherwise return with a failure
        guard let url = URL(string: urlString) else {
            completion(.failure(.badURL))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            // the task has completed – push our work back to the main thread
            DispatchQueue.main.async {
                
                if let _ = error {
                    completion(.failure(.requestFailed))
                    return
                }
                
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    completion(.failure(.invalidData))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(.invalidData))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let responseData = try decoder.decode([String: String].self, from: data )
                      completion(.success(responseData))
                } catch {
                    completion(.failure(.invalidData))
                }
            }
        }.resume()
    }
}


extension NetworkService: URLSessionDelegate, URLSessionTaskDelegate {
    
    public func urlSession(_ session: URLSession, task: URLSessionTask, willPerformHTTPRedirection response: HTTPURLResponse, newRequest request: URLRequest, completionHandler: @escaping (URLRequest?) -> Void) {
        
        guard response.statusCode == 301 else {
            completionHandler(request)
            return
        }
        completionHandler(nil)
    }
}
