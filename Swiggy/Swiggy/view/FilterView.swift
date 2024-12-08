//
//  FilterView.swift
//  Swiggy
//
//  Created by Nishtha Verma on 09/12/24.
//

import SwiftUI

struct FilterView: View {
    var details: OneDeliveryData
    var filterData: [FilterData2] {
        details.filterDataForBottom ?? []
    }
    var data: [OneDeliveryDetail] {
        details.data
    }
    
    @Binding var isDetailViewActive: Bool
    @State private var lastScrollOffset: CGFloat = 0
    @State private var isScrollingDown: Bool = false

    var body: some View {
        LazyVStack(alignment: .leading, spacing: 0, pinnedViews: [.sectionHeaders]) {
            Section {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        ForEach(data, id: \.self) { count in
                            getViewForOneView(data: count)
                        }
                    }
                    .background(
                        GeometryReader { proxy in
                            Color.clear
                                .onAppear {
                                    lastScrollOffset = proxy.frame(in: .global).minY
                                }
                                .onChange(of: proxy.frame(in: .global).minY) { newOffset in
                                    handleScroll(newOffset: newOffset)
                                }
                        }
                    )
                }
            } header: {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        ForEach(filterData, id: \.self) { data in
                            HStack {
                                if let icon =  data.leadingIcon {
                                    Image(systemName: icon)
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                        .padding(4)
                                }
                                Text(data.title)
                                    .font(Font.regular12Font)
                                    .foregroundStyle(Color.black)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                if let icon = data.endIcon {
                                    Image(systemName: icon)
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                        .padding(4)
                                }
                            }
                            .padding(12)
                            .background(RoundedRectangle(cornerRadius: 24).stroke(Color.gray, lineWidth: 1))
                        }
                    }
                    .safeAreaPadding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 0))
                    .padding(16)
                    .background(Color.white)
                    
                }
            }
        }
    }

    private func handleScroll(newOffset: CGFloat) {
        let scrollDelta = newOffset - lastScrollOffset
        isScrollingDown = scrollDelta < 0
        isDetailViewActive = newOffset < -50
        lastScrollOffset = newOffset
    }

    @ViewBuilder
    func getViewForOneView(data: OneDeliveryDetail) -> some View {
        HStack(alignment: .top) {
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
            Spacer()
        }
    }
}
