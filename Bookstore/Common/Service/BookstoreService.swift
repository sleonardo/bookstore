//
//  BookstoreService.swift
//  Bookstore
//
//  Created by Leonardo Simoza on 20/07/21.
//

import Foundation
import Combine
import UIKit

protocol BookstoreService {
    var apiSession: APIService {get}
    
    func fetchBooks() -> AnyPublisher<Books, APIError>
    func fetchComments(bookId: Int) -> AnyPublisher<Comments, APIError>
    func fetchSuggestions(bookId: Int) -> AnyPublisher<Books, APIError>
    
}

/// Services for Books
extension BookstoreService {
    
    func fetchBooks() -> AnyPublisher<Books, APIError> {
        return apiSession.request(Endpoint.books)
                   .map(\.value)
                   .eraseToAnyPublisher()
    }
    
    func fetchComments(bookId: Int) -> AnyPublisher<Comments, APIError> {
        return apiSession.request(Endpoint.commentsBy(bookId: bookId))
                   .map(\.value)
                   .eraseToAnyPublisher()
    }
    
    func fetchSuggestions(bookId: Int) -> AnyPublisher<Books, APIError> {
        return apiSession.request(Endpoint.suggestionsBy(bookId: bookId))
                   .map(\.value)
                   .eraseToAnyPublisher()
    }
}
