//
//  BookstoreView.swift
//  Bookstore
//
//  Created by Leonardo Simoza on 17/07/21.
//

import SwiftUI
struct UserIn: Hashable {
    let name: String
    let title: String
}


struct BookstoreView: View {
    // MARK: - Variables and Constants
    
    @EnvironmentObject var navigation: NavigationStack
    @ObservedObject var bookstoreViewModel: BookstoreViewModel = BookstoreViewModel()
    @State var showSearch = false
    
    var isRoot: Bool = true
    
    private let gridDisplay = [
        GridItem(.flexible(), spacing: 0)
    ]
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                header
                scrollView
            }.onAppear {
                self.bookstoreViewModel.fetchBooks()
            }
        }.background(Color.mainBackground)
        .edgesIgnoringSafeArea(.all)
    }
}

// MARK: Main container view
private extension BookstoreView {
    var header: some View {
        GeometryReader { geometry in
            //VStack {
            HStack(alignment: .top, spacing: 0) {
                //if (!self.hiddenNav) {
                if self.showSearch {
                    HStack {
                        Spacer(minLength: 12)
                        HStack (alignment: .center,
                                spacing: 10) {
                            Image("IconSearch")
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: Helper.sizeScaleWidth(13), height: Helper.sizeScaleHeight(12), alignment: .center)
                                .foregroundColor(.imageIconColor)
                            
                            TextField("Search:",
                                      text: $bookstoreViewModel.searchText,
                                      onEditingChanged: { (isBegin) in
                                        if isBegin {
                                            print("Begins editing")
                                        } else {
                                            print("Finishes editing")
                                            self.showSearch.toggle()
                                            bookstoreViewModel.cleanSearch()
                                        }
                                      },
                                      onCommit: {
                                        print("commit")
                                      }
                            ).accessibility(identifier: "tfSearch")
                            Button(action: {
                                withAnimation {
                                    self.showSearch.toggle()
                                    bookstoreViewModel.cleanSearch()
                                }
                            }) {
                                Image(systemName: "xmark.circle.fill").foregroundColor(.red)
                                    .frame(width: Helper.sizeScaleWidth(14), height: Helper.sizeScaleHeight(14), alignment: .center)
                            }.padding(.horizontal, 8)
                            .accessibility(identifier: "btnCleanSearch")
                        }  // HSTack
                        .padding([.top,.bottom], 2)
                        .padding(.leading, 5)
                        .background(Color.white, alignment: .center)
                        .cornerRadius(100)
                        Spacer(minLength: 13)
                    }
                } else {
                    Button( action: {print("")}){
                        Image(isRoot ? "IconNotification" : "IconBack")
                            .renderingMode(.original)
                            .frame(width: Helper.sizeScaleWidth(18), height: Helper.sizeScaleHeight(18), alignment: .center)
                            .padding(.leading, Helper.sizeScaleWidth(13))
                    }.accessibility(identifier: "btnIconNotification")
                    Spacer()
                    Text(Localizable.navTitleLibrary.localized().uppercased())
                        .foregroundColor(.white)
                        .modifier(Headline())
                        .accessibility(identifier: "navTitleLibrary")
                    Spacer()
                    Button( action: {
                        self.showSearch.toggle()
                    }){
                        Image("IconSearch")
                            .renderingMode(.original)
                            .frame(width: Helper.sizeScaleWidth(18), height: Helper.sizeScaleHeight(18), alignment: .center)
                            .padding(.trailing, Helper.sizeScaleWidth(13))
                    }.disabled(!isRoot)
                    .opacity(isRoot ? 1 : 0)
                    .animation(.spring())
                    .accessibility(identifier: "btnIconSearch")
                }
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, idealHeight: Helper.sizeScaleHeight(101),maxHeight: Helper.sizeScaleHeight(101), alignment: .center)
            .padding(.top,Helper.sizeScaleHeight(0))
            .edgesIgnoringSafeArea(.top)
            .background(Image("NavigationBar")
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFill()
                            .frame(width: Helper.sizeScaleWidth(geometry.size.width), height: Helper.sizeScaleHeight(101), alignment: .top).edgesIgnoringSafeArea(.top))
        }.frame(height: Helper.sizeScaleHeight(101), alignment: .top)
    }
}

// MARK: Main container view
private extension BookstoreView {
    var scrollView : some View {
        ScrollView {
            VStack {
                contentGroup
            }.padding(.top, Helper.sizeScaleHeight(21))
        }
    }
}

// MARK: Main container view
private extension BookstoreView {
    var contentGroup: some View {
        Group {
            if bookstoreViewModel.isLoading {
                SlidingCirclesView()
            } else {
                dataGrid
            }
        }
    }
}

private extension BookstoreView {
    var dataGrid: some View {
        LazyVGrid(columns: gridDisplay, spacing: 10) {
            if !bookstoreViewModel.noFound {
                ForEach(bookstoreViewModel.books, id: \.id) { book in
                    CellBook(book: book).onTapGesture {
                        self.navigation.advance(
                            NavigationItem(view: AnyView(BookDetailView(book: book))), title: Localizable.navTitleBookDetail.localized())
                    }.accessibility(identifier: "cellBook")
                }.accessibility(identifier: "cellBookT")
            } else {
                Spacer()
                Image("SearchPlaceholder")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: Helper.sizeScaleWidth(50), height: Helper.sizeScaleHeight(50), alignment: .center)
                    .foregroundColor(Color.imageIcon2Color)
                    .padding(.bottom, Helper.sizeScaleHeight(20))
                Text(Localizable.lblSearch.localized())
                    .tracking(HelperFont.LetterSpacing.ls036.rawValue)
                    .fontWeight(.bold)
                    .lineSpacing(HelperFont.LineSpacing.lh1767.rawValue)
                    .modifier(BodyStyle())
                    .foregroundColor(Color.imageIcon2Color)
                    .padding(.bottom, Helper.sizeScaleHeight(12))
                Text(Localizable.lblSearchBooks.localized())
                    .tracking(HelperFont.LetterSpacing.ls024.rawValue)
                    .fontWeight(.light)
                    .lineSpacing(HelperFont.LineSpacing.lh25.rawValue)
                    .modifier(Callout())
                    .foregroundColor(Color.imageIcon2Color)
                    //.modifier(Callout)
                Spacer()
            }
        }.padding(.bottom, Helper.sizeScaleHeight(80))
    }
}


struct BookstoreView_Previews: PreviewProvider {
    static var previews: some View {
        BookstoreView()
    }
}
