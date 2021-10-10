//
//  NewsNetwork.swift
//  News
//
//  Created by Farkhod on 10.10.2021.
//

import UIKit

class NetworkManager: NSObject {
    static let shared = NetworkManager()
    
    func getNews(completed: @escaping (Result<[NewsData], APError>) -> Void) {
        guard let url = URL(string: Constants.BASE_URL + Constants.Version + "everything") else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(NewsResponse.self, from: data)
                completed(.success(decodedResponse.request))
            } catch {
                completed(.failure(.invalidData))
            }
            
            _ = 0
        }
        task.resume()
    }
}
