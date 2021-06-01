//
//  HttpError.swift
//  PokeApiDemo
//
//  Created by Julia Liliana Sierra Rojas on 29/05/21.
//

import Foundation

public enum HttpError: Error, LocalizedError {
    case informational(message: String)
    case redirection(message: String)
    case noNetwork(message: String)
    case unknownError(message: String)
    case unauthorized(message: String, Data)
    case serverError(message: String)
    case jsonParsingError(message: String)
    case other(Error)
}

public enum HttpStatus: Error {
    case success(Dictionary<String, Any>)
    case error(HttpError)
    
}
