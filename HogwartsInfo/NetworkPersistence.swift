//
//  NetworkPersistence.swift
//  HogwartsInfo
//
//  Created by Santi Pérez on 6/3/23.
//

import SwiftUI

final class NetworkPersistence {
    static let shared = NetworkPersistence()
    
    func getSpells() async throws -> Spells {
        try await getJSON(request: .get(url: .getSpells), type: Spells.self)
    }
    
    func getBooks() async throws -> Books {
        try await getJSON(request: .get(url: .getBooks), type: Books.self)
    }
    
    func getCharacters() async throws -> CharactersHI {
        try await getJSON(request: .get(url: .getCharacters), type: CharactersHI.self)
    }
    
    func getAdditionalsInfo() async throws -> AdditionalsInfo {
        try await getJSON(request: .get(url: .getAdditionalsInfo), type: AdditionalsInfo.self)
    }
    
    func getCharacter(id: Int) async throws -> CharacterHI {
        try await getJSON(request: .get(url: .getCharacters.appending(path: "\(id)")), type: CharacterHI.self)
    }

    func getJSON<JSON:Codable>(request:URLRequest, type:JSON.Type) async throws -> JSON {
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let response = response as? HTTPURLResponse else { throw NetworkError.unknown }
            if response.statusCode == 200 {
                do {
                    return try JSONDecoder().decode(JSON.self, from: data)
                } catch {
                    throw NetworkError.dataInvalid(error)
                }
            } else {
                throw NetworkError.status(response.statusCode)
            }
        } catch let error as NetworkError {
            throw error
        } catch {
            throw NetworkError.general(error)
        }
    }

}
