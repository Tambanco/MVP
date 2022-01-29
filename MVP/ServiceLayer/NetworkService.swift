//
//  NetworkService.swift
//  MVP
//
//  Created by tambanco 🥳 on 29.01.2022.
//

import Foundation

protocol NetworkServiceProtocol {
    func getPasta(completion: @escaping (Result<[Pasta]?, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    func getPasta(completion: @escaping (Result<[Pasta]?, Error>) -> Void) {
        let urlString = "https://raw.githubusercontent.com/Tambanco/PastaJSON/main/pasta.json"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            do {
                let obj = try JSONDecoder().decode([Pasta].self, from: data!)
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
