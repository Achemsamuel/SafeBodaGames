//
//  ApiError.swift
//  SafeBoda
//
//  Created by Achem Samuel on 6/23/20.
//  Copyright © 2020 Achem Samuel. All rights reserved.
//

import Foundation

enum AppError: Error, LocalizedError {
    case badRequestData
    case badUrl
    case endpointError(message: String)
    case emptyResponseData
    case unDecodableResponse
    case unknownError
    
    
    public var errorDescription: String? {
        switch self {
        case .badRequestData:
            return "The correct data could not be sent"
        case .badUrl:
            return "Incorrect destination"
        case .endpointError(let message):
            return message
        case .emptyResponseData:
            return "Response is empty"
        case .unDecodableResponse:
            return "The response could not be decoded"
        case .unknownError:
            return "An error occurred"
        }
    }
}

enum ResponseError: Error {
    case ErrorResponse(String)
    
}
extension ResponseError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .ErrorResponse(let error):
            return NSLocalizedString(error, comment: error)
    }
  }
}
