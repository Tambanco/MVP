//
//  NetworkService.swift
//  MVP
//
//  Created by tambanco 🥳 on 28.01.2022.
//

import Foundation

protocol NetworkServiceProtocol {
    func getPastaInfo(completion: @escaping (Result<[PastaInfo]?, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    func getPastaInfo(completion: @escaping (Result<[PastaInfo]?, Error>) -> Void) {
        let urlString = "https://raw.githubusercontent.com/Tambanco/PastaJSON/main/pasta.json"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            do {
                let obj = try JSONDecoder().decode([PastaInfo].self, from: data!)
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    
}
