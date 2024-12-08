//
//  WhatsInYourMindView.swift
//  Swiggy
//
//  Created by Nishtha Verma on 09/12/24.
//

import SwiftUI
struct WhatsInYourMindView: View {
    var data1: WhatsInYourMind
    var data: [WhatsInYourMindData] {
        data1.data
    }
    
    private var firstRowData: [WhatsInYourMindData] {
        Array(data.prefix((data.count + 1) / 2))
    }
    
    private var secondRowData: [WhatsInYourMindData] {
        Array(data.suffix(data.count / 2))
    }

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            VStack(spacing: 24) {
                HStack(spacing: 12) {
                    ForEach(firstRowData, id: \.self) { item in
                        VStack {
                            Image(item.imageUrl)
                                .resizable()
                                .frame(width: 60, height: 60)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .padding(.horizontal, 8)
                            Text(item.title)
                                .foregroundColor(Color.black)
                                .font(.regular12Font)
                        }
                    }
                }
                HStack(spacing: 12) {
                    ForEach(secondRowData, id: \.self) { item in
                        VStack {
                            Image(item.imageUrl)
                                .resizable()
                                .frame(width: 60, height: 60)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .padding(.horizontal, 8)
                            Text(item.title)
                                .foregroundColor(Color.black)
                                .font(.regular12Font)
                        }
                    }
                }
            }
            .padding()
        }
    }
}
