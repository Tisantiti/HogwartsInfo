//
//  NetworkURL.swift
//  HogwartsInfo
//
//  Created by Santi Pérez on 6/3/23.
//

import Foundation

let developmentURL = URL(string: "https://harry-potter-api.onrender.com")!

let hostURL = developmentURL

extension URL {
    static let getSpells = hostURL.appending(path: "/hechizos")
    static let getBooks = hostURL.appending(path: "/libros")
    static let getCharacters = hostURL.appending(path: "/personajes")
    static let getAdditionalsInfo = hostURL.appending(path: "/info")
}

