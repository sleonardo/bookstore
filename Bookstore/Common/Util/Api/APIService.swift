//
//  APIService.swift
//  Bookstore
//
//  Created by Leonardo Simoza on 21/07/21.
//

import Combine
import UIKit

protocol APIService {
    func request<T: Decodable>(_ request: RequestBuilder) -> AnyPublisher<Response<T>, APIError>
}
