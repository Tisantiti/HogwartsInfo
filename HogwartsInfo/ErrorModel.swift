//
//  ErrorModel.swift
//  HogwartsInfo
//
//  Created by Santi Pérez on 6/3/23.
//

import Foundation

enum NetworkError:Error {
    case general(Error)
    case status(Int)
    case dataInvalid(Error)
    case badData
    case unknown
    
    var description:String {
        switch self {
        case .general(let error):
            return "Error general de la llamada \(error.localizedDescription)."
        case .status(let int):
            return "Error de STATUS, código: \(int)."
        case .dataInvalid(let error):
            return "Dato no válido \(error)."
        case .badData:
            return "Dato no válido para el constructor."
        case .unknown:
            return "Error desconocido."
        }
    }
}
