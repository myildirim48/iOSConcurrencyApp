//
//  APIService.swift
//  iOSConcurrencyApp
//
//  Created by YILDIRIM on 12.06.2023.
//

import Foundation
struct APIService {
    let urlString: String
    
    func getJSON<T: Codable>(dateDecodingStrategy:JSONDecoder.DateDecodingStrategy = .deferredToDate,
                             keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) async throws -> T {
        
        guard let url = URL(string: urlString) else { throw APIError.invalidUrl }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw APIError.invalidResponseStatus
            }
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = dateDecodingStrategy
            decoder.keyDecodingStrategy = keyDecodingStrategy
            
            do {
                let decodedData = try decoder.decode(T.self, from: data)
                return decodedData
            } catch {
                throw APIError.decodingError(error.localizedDescription)
            }
        }
        catch {
            throw APIError.dataTaskError(error.localizedDescription)
        }
    }
}


