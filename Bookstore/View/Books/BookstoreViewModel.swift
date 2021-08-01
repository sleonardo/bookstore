//
//  BookstoreViewModel.swift
//  Bookstore
//
//  Created by Leonardo Simoza on 20/07/21.
//

import Foundation
import Combine
import SwiftUI

class BookstoreViewModel : ObservableObject, BookstoreService {
    var apiSession: APIService
    @Published private(set) var books: Books = []
    @Published var isLoading = false
    @Published var searchText = ""
    @Published var noFound = false
    
    private(set) var booksPublisher: CurrentValueSubject<Books, Never> = .init([])
    var isLoadingContent: CurrentValueSubject<Bool, Never> = .init(false)
    
    var cancellables = Set<AnyCancellable>()
    
    init(apiSession: APIService = APISession()) {
        self.apiSession = apiSession
    }
    
    func initializate() {
        isLoadingContent
                    .receive(on: RunLoop.main)
                    .assign(to: \.isLoading, on: self)
                    .store(in: &cancellables)
        filterBooksPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.books, on: self)
            .store(in: &cancellables)
    }
    
    var filterBooksPublisher: AnyPublisher<Books, Never> {
        Publishers.CombineLatest(booksPublisher, $searchText)
            .debounce(for: 0.1, scheduler: RunLoop.main)
            .receive(on: RunLoop.main)
            .map { [weak self] booksList, query in
                guard let self = self, (!query.isEmpty) else { return booksList }
                let filterData = self.filterData(data: self.booksPublisher.value,
                                                          search: query)
                return filterData
            }
        .eraseToAnyPublisher()
    }
    
    func filterData(data: Books, search: String) -> Books {
        let filteredBooks = data.filter {
            $0.title.lowercased().contains(search.lowercased()) ||
            $0.author.lowercased().contains(search.lowercased())
        }
        self.noFound = filteredBooks.count == 0 ? true : false
        return filteredBooks
    }

    func fetchBooks() {
        self.initializate()
        guard !isLoadingContent.value else { return }
        isLoadingContent.send(true)
        self.fetchBooks()
            .replaceError(with: [])
            .share()
            .subscribe(on: RunLoop.main)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { [weak self] _ in
                self?.isLoadingContent.send(false)
            }) { [weak self] data in
                self?.booksPublisher.send(data)
            }.store(in: &cancellables)
    }
    
    func cleanSearch() {
        searchText = ""
        self.noFound = false
    }
    
}
