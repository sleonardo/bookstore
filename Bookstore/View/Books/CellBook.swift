//
//  CellBook.swift
//  Bookstore
//
//  Created by Leonardo Simoza on 18/07/21.
//

import SwiftUI


struct CellBook: View {
    var book: Book
    
    var body: some View {
        VStack {
            HStack {
                loadImage
                    .shadow(color: Color.black.opacity(0.38), radius: 5, x: 1, y: -2)
                    .padding(.leading, Helper.sizeScaleWidth(30))
                    .padding(.trailing, Helper.sizeScaleWidth(20))
                    .padding(.vertical, Helper.sizeScaleHeight(15))
                VStack(alignment: .leading) {
                    Text(book.title)
                        .modifier(Title())
                        .lineSpacing(HelperFont.LineSpacing.lh20.rawValue)
                        .padding(.bottom, Helper.sizeScaleHeight(3))
                    Text(book.author)
                        .modifier(Subheadline())
                        .lineSpacing(HelperFont.LineSpacing.lh1767.rawValue)
                        
                }
                Spacer()
            }.background(Color.clear)
            .cornerRadius(5)
            .shadow(color: Color.black.opacity(0.05), radius: 1, x: 0, y: 1)
            .listRowBackground(Color.clear)
        }.cornerRadius(5)
        .background(Color.white)
        .padding(.horizontal, Helper.sizeScaleWidth(30))
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.launchBackground.opacity(0.2), lineWidth: 1)
                .padding(.horizontal, Helper.sizeScaleWidth(30))
        )
    }
}


// MARK: Main container view
private extension CellBook {
    var loadImage: some View {
        ImageView(url: book.image,
                  width: Helper.sizeScaleWidth(39),
                  height: Helper.sizeScaleHeight(60), circle: false)
    }
}
struct CellBook_Previews: PreviewProvider {
    static var previews: some View {
        CellBook(book: Book(image: "", title: "Test Title", id: 1, author: "Test Author", year: "2021", status: "Available", genre: "Comics"))
    }
}
