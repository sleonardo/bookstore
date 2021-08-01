//
//  APIEndpoint.swift
//  Bookstore
//
//  Created by Leonardo Simoza on 20/07/21.
//

import Foundation

enum Endpoint {
    case books
    case bookBy(id: Int)
    case commentsBy(bookId: Int)
    case suggestionsBy(bookId: Int)
}
var baseURL: String {
    return Constants.PathWS.apiURL
}
extension Endpoint: RequestBuilder {
    var urlRequest: URLRequest {
        switch self {
        case .books:
            guard let url = URL(string: baseURL + Constants.PathWS.books)
                else {preconditionFailure("Invalid URL format")}
            let request = URLRequest(url: url)
            return request
        case .bookBy(id: let id):
            
            guard let url = URL(string: baseURL + Constants.PathWS.books + "/\(String(id))")
                else {preconditionFailure("Invalid URL format")}
            
            let request = URLRequest(url: url)
            return request
        case .commentsBy(bookId: let bookId):
            guard let url = URL(string: baseURL + Constants.PathWS.books + "/\(String(bookId))" + Constants.PathWS.comments)
                else {preconditionFailure("Invalid URL format")}
            
            let request = URLRequest(url: url)
            return request
        case .suggestionsBy(bookId: let bookId):
            guard let url = URL(string: baseURL + Constants.PathWS.books + "/\(String(bookId))" + Constants.PathWS.suggestions)
                else {preconditionFailure("Invalid URL format")}
            
            let request = URLRequest(url: url)
            return request
        }
        
    }
}
