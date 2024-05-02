//
//  TechieButlerApiService.swift
//  Techie Butler
//
//  Created by Akhil Jain on 01/05/24.
//

import Foundation

class TechieButlerApiService{
    
    func fetchData(completion: @escaping ([TechieModel]?, Error?) -> Void) {
            guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
                return
            }

            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else {
                    completion(nil, error)
                    return
                }

                do {
                    let decodedData = try JSONDecoder().decode([TechieModel].self, from: data)
                    completion(decodedData, nil)
                } catch {
                    completion(nil, error)
                }
            }.resume()
        }
    
}
