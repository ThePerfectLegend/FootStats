//
//  NetworkManager.swift
//  FootStat
//
//  Created by Nizami Tagiyev on 04.08.2022.
//

import Foundation

class NetworkManager {
    static let instance = NetworkManager()
    
    private init() { }
        
    func download(url: URL) async throws -> Data {
        let (data, responce) = try await URLSession.shared.data(from: url)
        guard let outputResponce = responce as? HTTPURLResponse,
              outputResponce.statusCode >= 200 && outputResponce.statusCode < 300
        else {
            throw URLError(.badServerResponse)
        }
        return data
    }
}
