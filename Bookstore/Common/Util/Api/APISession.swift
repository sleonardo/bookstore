//
//  APISession.swift
//  Bookstore
//
//  Created by Leonardo Simoza on 21/07/21.
//

import Combine
import UIKit

struct APISession: APIService {
    
    func request<T: Decodable>(_ request: RequestBuilder) -> AnyPublisher<Response<T>, APIError> {
        return URLSession.shared
            .dataTaskPublisher(for: request.urlRequest)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw APIError.unknown
                }
                if (httpResponse.statusCode == 401) {
                    throw APIError.apiError(reason: "Unauthorized");
                }
                if (httpResponse.statusCode == 403) {
                    throw APIError.apiError(reason: "Resource forbidden");
                }
                if (httpResponse.statusCode == 404) {
                    throw APIError.apiError(reason: "Resource not found");
                }
                if (405..<500 ~= httpResponse.statusCode) {
                    throw APIError.apiError(reason: "client error");
                }
                if (500..<600 ~= httpResponse.statusCode) {
                    throw APIError.apiError(reason: "server error");
                }
                let value = try JSONDecoder().decode(T.self, from: data)
                return Response(value: value, response: response)
            }
            .mapError { error in
                // if it's our kind of error already, we can return it directly
                if let error = error as? APIError {
                    return error
                }
                // if it is a URLError, we can convert it into our more general error kind
                if let urlerror = error as? URLError {
                    return APIError.networkError(from: urlerror)
                }
                // if all else fails, return the unknown error condition
                return APIError.unknown
            }
            .eraseToAnyPublisher()
    }
}

struct Response<T> {
    let value: T
    let response: URLResponse
}
