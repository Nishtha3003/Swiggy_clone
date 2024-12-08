//
//  CustomTextField.swift
//  Swiggy
//
//  Created by Nishtha Verma on 09/12/24.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    var trailingIconOne: String?
    var trailingIconTwo: String?
    var onMicClick: () -> Void
    var onSearchClick: (String) -> Void
    
    var body: some View {
        HStack {
            ZStack(alignment: .leading) {
              TextField("", text: $text)
                    .onChange(of: text, {
                        onSearchClick(text)
                    })
                    .opacity(0)
              Text(text)
                    .font(Font.regular16Font)
                    .foregroundColor(Color.gray.opacity(0.8))
            }
            Spacer()
            if let trailingIconOne {
                Image(systemName: trailingIconOne)
                    .foregroundColor(Color.black.opacity(0.7))
            }
            if let trailingIconTwo {
                Rectangle()
                    .fill(Color.gray.opacity(0.5))
                    .frame(width: 1, height: 32)
                Image(systemName: trailingIconTwo)
                    .foregroundColor(Color.orange)
            }
        }
        .padding(12)
        .background(Color.white)
        .overlay {
            RoundedRectangle(cornerRadius: 12).stroke(Color.gray.opacity(0.3))
        }
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

