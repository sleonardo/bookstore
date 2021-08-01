//
//  BookDetailView.swift
//  Bookstore
//
//  Created by Leonardo Simoza on 17/07/21.
//

import SwiftUI

struct BookDetailView: View {
    // MARK: - Variables and Constants
    
    @EnvironmentObject var navigation: NavigationStack
    @ObservedObject var bookDetailViewModel: BookDetailViewModel = BookDetailViewModel()
    @State var available: Bool = true
    let book: Book
    
    private let gridDisplay = [
        GridItem(.flexible(), spacing: 0)
    ]
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                Header(isRoot: false, title: Localizable.navTitleBookDetail.localized(), hiddenNav: false) {
                    self.navigation.unwind()
                } onActionTrailing: {
                    print("some")
                }

                contentView
            }
        }.background(Color.mainBackground)
        .edgesIgnoringSafeArea(.all)
    }
}

// MARK: Main container view
private extension BookDetailView {
    var contentView : some View {
        VStack {
            detailView
        }.onAppear {
            self.bookDetailViewModel.fetchComments(bookId: book.id)
            available = book.status.lowercased().isEqual("available")
        }.padding(.top, Helper.sizeScaleHeight(21))
    }
}

private extension BookDetailView {
    var detailView : some View {
        VStack {
            VStack {
                HStack {
                    loadImage
                        .shadow(color: Color.black.opacity(0.38), radius: 5, x: 1, y: -2)
                        .padding(.leading, Helper.sizeScaleWidth(30))
                        .padding(.trailing, Helper.sizeScaleWidth(20))
                        .padding(.top, Helper.sizeScaleHeight(12))
                        .padding(.bottom, Helper.sizeScaleHeight(30))
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading, spacing: 3) {
                            Text(book.title)
                                .tracking(HelperFont.LetterSpacing.ls058.rawValue)
                                .fontWeight(.bold)
                                .lineSpacing(HelperFont.LineSpacing.lh25.rawValue)
                                .modifier(LargeTitle())
                            Text(book.status)
                                .tracking(HelperFont.LetterSpacing.ls036.rawValue)
                                .foregroundColor(available ? Color.availableColor : Color.unavailableColor)
                                .modifier(BodyStyle())
                        }
                        Group {
                            Text(book.author)
                                .tracking(HelperFont.LetterSpacing.ls024.rawValue)
                                .fontWeight(.light)
                                .modifier(Subheadline())
                            Text(book.year)
                                .tracking(HelperFont.LetterSpacing.ls024.rawValue)
                                .fontWeight(.light)
                                .modifier(Subheadline())
                            Text(book.genre.capitalized)
                                .tracking(HelperFont.LetterSpacing.ls024.rawValue)
                                .fontWeight(.light)
                                .modifier(Subheadline())
                        }
                    }
                    Spacer()
                }.background(Color.clear)
                .cornerRadius(5)
                .shadow(color: Color.black.opacity(0.05), radius: 1, x: 0, y: 1)
                .listRowBackground(Color.clear)
                Button(action: {
                    print("Add Wishlist tapped")
                    self.navigation.home()
                    
                }) {
                    Text(Localizable.btnAddWishlist.localized().uppercased())
                        .foregroundColor(Color.textSecondaryColor)
                        .fontWeight(.heavy)
                        .modifier(ButtonTitle())
                }.buttonStyle(
                    PrimaryButtonStyle(backgroundColor: .clear,
                                       foregroundColor: .buttomBorderColor,
                                       isDisabled: false,
                                       width: 275))
                
                Button(action: {
                    print("Rent tapped")
                    //perform some tasks if needed before opening Destination view
                    self.navigation.home()
                }) {
                    Text(Localizable.btnRent.localized().uppercased())
                        .foregroundColor(available ? Color.white : .white.opacity(0.42))
                        .fontWeight(.heavy)
                        .modifier(ButtonTitle())
                }.disabled(!available)
                .padding(.top, Helper.sizeScaleHeight(10))
                .padding(.bottom, Helper.sizeScaleHeight(22))
                .buttonStyle(
                    GradientButtonStyle(backgroundColor: .clear,
                                        foregroundColor: .clear,
                                        gradientColors: !available ? [Color.buttomFillGradientBD1Color, Color.buttomFillGradientBD2Color, Color.buttomFillGradientBD3Color] : [],
                                        isDisabled: !available,
                                        width: 275))
                
            }.cornerRadius(5)
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.launchBackground.opacity(0.2), lineWidth: 1)
            )
            
            scrollView
        }.padding(.horizontal, Helper.sizeScaleWidth(20))
    }
}

// MARK: Main container view
private extension BookDetailView {
    var scrollView : some View {
        ScrollView {
            VStack {
                listContent
                Button(action: {
                    print("View All tapped")
                    self.navigation.home()
                    
                }) {
                    Text(Localizable.btnViewAll.localized().uppercased())
                        .foregroundColor(Color.textSecondaryColor)
                        .fontWeight(.light)
                        .modifier(ButtonTitle())
                }.buttonStyle(
                    PrimaryButtonStyle(backgroundColor: .clear,
                                       foregroundColor: .clear,
                                       isDisabled: false,
                                       width: 275))
            }.padding(.top, Helper.sizeScaleHeight(21))
            .background(Color.white)
        }
    }
}

// MARK: Main container view
private extension BookDetailView {
    var listContent: some View {
        Group {
            if bookDetailViewModel.isLoading {
                SlidingCirclesView()
            } else {
                dataGrid
            }
        }
    }
}

private extension BookDetailView {
    var dataGrid: some View {
        LazyVGrid(columns: gridDisplay, spacing: 10) {
            ForEach(bookDetailViewModel.comments.prefix(2), id: \.id) { comment in
                CellComment(comment: comment).onTapGesture {
                    self.navigation.home()
                }
            }
        }
    }
}

struct CellComment: View {
    let comment: Comment
    var body: some View {
        VStack {
            HStack {
                loadImage
                    .shadow(color: Color.black.opacity(0.38), radius: 5, x: 1, y: -2)
                    .padding(.leading, Helper.sizeScaleWidth(14))
                    .padding(.trailing, Helper.sizeScaleWidth(19))
                VStack(alignment: .leading) {
                    Text(comment.user.username.capitalized)
                        .tracking(HelperFont.LetterSpacing.ls036.rawValue)
                        .fontWeight(.bold)
                        .foregroundColor(.titleColor)
                        .lineSpacing(HelperFont.LineSpacing.lh1767.rawValue)
                        .modifier(BodyStyle())
                        .padding(.bottom, Helper.sizeScaleHeight(3))
                    Text(comment.content)
                        .tracking(HelperFont.LetterSpacing.ls024.rawValue)
                        .fontWeight(.light)
                        .lineSpacing(HelperFont.LineSpacing.lh1767.rawValue)
                        .modifier(Callout())
                    Divider().padding(.top, 15)
                }.animation(.easeInOut)
                Spacer()
            }.background(Color.clear)
            .cornerRadius(5)
            .shadow(color: Color.black.opacity(0.05), radius: 1, x: 0, y: 1)
            
        }.cornerRadius(5)
        .background(Color.white)
        .padding(.horizontal, Helper.sizeScaleWidth(30))
    }
}

// MARK: Main container view
private extension CellComment {
    var loadImage: some View {
        ImageView(url: comment.user.image,
                  width: Helper.sizeScaleWidth(47),
                  height: Helper.sizeScaleHeight(45), circle: true)
    }
}

// MARK: Main container view
private extension BookDetailView {
    var loadImage: some View {
        ImageView(url: book.image,
                  width: Helper.sizeScaleWidth(39),
                  height: Helper.sizeScaleHeight(60), circle: false)
    }
}
