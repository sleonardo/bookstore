//
//  BookDetailViewModel.swift
//  Bookstore
//
//  Created by Leonardo Simoza on 23/07/21.
//


import Foundation
import Combine
import SwiftUI

class BookDetailViewModel : ObservableObject, BookstoreService {
    var apiSession: APIService
    //@Published var comments = [Comment]()
    @Published private(set) var comments: [Comment] = []
    @Published var isLoading = false
    private(set) var commentsCurrentPublisher: CurrentValueSubject<Comments, Never> = .init([])
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
        commentsCurrentPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.comments, on: self)
            .store(in: &cancellables)
    }
    
    func fetchComments(bookId: Int) {
        self.initializate()
        guard !isLoadingContent.value else { return }
        isLoadingContent.send(true)
        self.fetchComments(bookId: bookId)
            .replaceError(with: [])
            .share()
            .subscribe(on: RunLoop.main)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { [weak self] _ in
                self?.isLoadingContent.send(false)
            }) { [weak self] data in
                self?.commentsCurrentPublisher.send(data)
            }.store(in: &cancellables)
    }
}
