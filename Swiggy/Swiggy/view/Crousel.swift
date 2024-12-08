//
//  Crousel.swift
//  Swiggy
//
//  Created by Nishtha Verma on 08/12/24.
//

import SwiftUI

struct Crousel: View {
    var image: [ImageResource]
    @State private var selectedImageIndex = 0
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $selectedImageIndex) {
                ForEach(0..<image.count, id: \.self) { index in
                    Image(image[selectedImageIndex])
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .tag(index)
                        .padding(16)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(height: 200)
            HStack {
                ForEach(0 ..< image.count, id: \.self) { index in
                    Circle()
                        .fill(index == selectedImageIndex ? Color.black : Color.gray)
                        .frame(
                            width: index == selectedImageIndex ? 8 : 4,
                            height: index == selectedImageIndex ? 8 : 4
                        )
                }
            }
        }
    }
}
