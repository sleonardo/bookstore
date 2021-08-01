//
//  Book.swift
//  Bookstore
//
//  Created by Leonardo Simoza on 20/07/21.
//

import Foundation

typealias Books = [Book]

// MARK: - Book
struct Book: Codable, Hashable {
    let image: String
    let title: String
    let id: Int
    let author, year, status, genre: String
    
    enum CodingKeys: String, CodingKey {
        case author, year, status, genre, title, image
        case id
    }
    
}


// MARK: Book convenience initializers and mutators

extension Book {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Book.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        image: String? = nil,
        title: String? = nil,
        id: Int? = nil,
        author: String? = nil,
        year: String? = nil,
        status: String? = nil,
        genre: String? = nil
    ) -> Book {
        return Book(
            image: image ?? self.image,
            title: title ?? self.title,
            id: id ?? self.id,
            author: author ?? self.author,
            year: year ?? self.year,
            status: status ?? self.status,
            genre: genre ?? self.genre
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
