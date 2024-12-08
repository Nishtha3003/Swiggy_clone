//
//  FoodListView.swift
//  Swiggy
//
//  Created by Nishtha Verma on 09/12/24.
//

import SwiftUI

struct FoodListView: View {
    var data: [ImageResource]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 12) {
                ForEach(data, id: \.self) {
                    image in
                    Image(image)
                        .resizable()
                        .frame(width: 60, height: 80)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
        }
    }
}
