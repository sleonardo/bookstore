//
//  ImageView.swift
//  Bookstore
//
//  Created by Leonardo Simoza on 23/07/21.
//

import SwiftUI


struct ImageView: View {
    let url: String
    let width: CGFloat
    let height: CGFloat
    let circle: Bool
    
    var body: some View {
        fetchImageView()
    }
    
    @ViewBuilder
    func fetchImageView() -> some View {
        if url.isEmpty {
            emptyImage
        } else {
            if circle {
                loadImage.clipShape(Circle())
            }else{
                loadImage
            }
        }
    }
}

// MARK: Container empty image
private extension ImageView {
    var emptyImage: some View {
        Image(systemName: "exclamationmark.triangle.fill")
            .frame(width: width, height: height)
            .foregroundColor(Color.yellow)
            .animation(.spring())
            .shadow(color: Color.black.opacity(0.18), radius: 2, x: 0.2, y: -0.92)
    }
}

// MARK: Container network image
private extension ImageView {
    var loadImage: some View {
        AsyncImage(
            url: URL(string: url)!,
            placeholder: { ActivityIndicator() },
            image: { Image(uiImage: $0).resizable() }
        ).frame(width: width, height: height)
        .animation(.spring())
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(url: "", width: 10, height: 10, circle: false)
    }
}
