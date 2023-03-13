//
//  NetworkRequest.swift
//  HogwartsInfo
//
//  Created by Santi Pérez on 6/3/23.
//

import Foundation

enum HTTPMethod:String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
}

extension URLRequest {
    static func get(url:URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.get.rawValue
        request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }

    static func post<JSON:Codable>(url:URL, method:HTTPMethod = .post, body:JSON? = nil) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        if let body {
            request.httpBody = try? JSONEncoder().encode(body)
        }
        return request
    }
}
