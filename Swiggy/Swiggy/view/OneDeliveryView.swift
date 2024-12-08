//
//  OneDeliveryView.swift
//  Swiggy
//
//  Created by Nishtha Verma on 08/12/24.
//

import SwiftUI

struct OneDeliveryView: View {
    var details: OneDeliveryData
    var filterData: [FilterData] {
        details.filterData
    }
    var data: [OneDeliveryDetail] {
        details.data
    }
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack {
                    ForEach(filterData, id: \.self) { data in
                        Text(data.title)
                            .font(Font.regular12Font)
                            .foregroundStyle(data.isSelected ? Color.white : Color.black)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(RoundedRectangle(cornerRadius: 12).fill(data.isSelected ? Color.black : Color.white))
                    }
                    
                }
            })
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack {
                    ForEach(data, id: \.self) { count in
                        getViewForOneView(data: count)
                    }
                }
            })
        }
    }
    
    @ViewBuilder
    func getViewForOneView(data: OneDeliveryDetail) -> some View {
        VStack(alignment: .leading) {
            ZStack {
                Image(data.image)
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "1.circle.fill")
                            .foregroundColor(Color.orange)
                        Spacer()
                        Image(systemName: data.isFavroite ? "heart.fill" : "heart")
                            .foregroundColor(Color.red)
                    }
                    Spacer()
                    VStack(alignment: .leading, spacing: 0) {
                        Text(data.discount)
                            .font(Font.bold24Font)
                            .foregroundColor(Color.white)
                        Text(data.discountDetail)
                            .font(Font.regular16Font)
                            .foregroundColor(Color.white)
                    }
                }
                .padding(12)
                LinearGradient(colors: [Color.clear, Color.clear, Color.black.opacity(0.4)], startPoint: .top, endPoint: .bottom)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .background(RoundedRectangle(cornerRadius: 12))
            .frame(width: 150, height: 150)
            VStack(alignment: .leading, spacing: 0) {
                Text(data.title)
                    .font(Font.bold16Font)
                    .foregroundColor(Color.black)
                HStack(spacing: 4) {
                    Image(systemName: "star.circle.fill")
                        .foregroundColor(.green)
                    Text(String(data.rating))
                        .font(Font.regular12Font)
                    Circle().fill(Color.gray).frame(width: 4)
                    Text(String(data.deliveryTime))
                        .font(Font.regular12Font)
                }
                Text(data.category)
                    .font(Font.regular12Font)
                    .foregroundColor(Color.gray)
            }
        }
    }
}
