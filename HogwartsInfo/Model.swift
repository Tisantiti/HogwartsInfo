//
//  Model.swift
//  HogwartsInfo
//
//  Created by Santi Pérez on 6/3/23.
//

import Foundation

// MARK: - Spell
struct Spell: Codable, Identifiable, Hashable {
    let id: Int
    let name, usage: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "hechizo"
        case usage = "uso"
    }
}

typealias Spells = [Spell]

// MARK: - Book
struct Book: Codable, Identifiable, Hashable {
    let id: Int
    let spanishTitle, englishTitle, releaseDate, author: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case spanishTitle = "libro"
        case englishTitle = "titulo_original"
        case releaseDate = "fecha_de_lanzamiento"
        case author = "autora"
        case description = "descripcion"
    }
}

typealias Books = [Book]

// MARK: - Character
struct CharacterHI: Codable, Identifiable, Hashable {
    let id: Int
    let name, nickName: String
    let studentAtHogwarts: Bool
    let hogwartsHouse: HogwartsHouses
    let actor: String
    let children: [String]
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "personaje"
        case nickName = "apodo"
        case studentAtHogwarts = "estudianteDeHogwarts"
        case hogwartsHouse = "casaDeHogwarts"
        case actor = "interpretado_por"
        case children = "hijos"
        case image = "imagen"
    }
}

enum HogwartsHouses: String, Codable {
    case gryffindor = "Gryffindor"
    case ravenclaw = "Ravenclaw"
    case slytherin = "Slytherin"
    case none = "ninguna"
}

typealias CharactersHI = [CharacterHI]

// MARK: - AdditionalInfo
struct AdditionalInfo: Codable, Identifiable, Hashable {
    let id: Int
    let infoType, content: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case infoType = "tipo"
        case content = "contenido"
    }
}

typealias AdditionalsInfo = [AdditionalInfo]

