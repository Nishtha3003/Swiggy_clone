//
//  ContentView.swift
//  Swiggy
//
//  Created by Nishtha Verma on 08/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var userInput: String = ""
    @StateObject var viewModel = HomeViewModel()
    @State private var lastScrollOffset: CGFloat = 0
    @State private var isScrollingDown: Bool = false
    @State private var isNotAtTop: Bool = false
    @State private var isDetailViewActive: Bool = false
    @State private var selectedTab = 1

    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                ScrollView {
                    GeometryReader { proxy in
                        Color.clear
                            .onAppear {
                                lastScrollOffset = proxy.frame(in: .global).minY
                            }
                            .onChange(of: proxy.frame(in: .global).minY) { newOffset in
                                handleScroll(newOffset: newOffset)
                            }
                    }
                    .frame(height: 0)

                    VStack(spacing: 0) {
                        if !isNotAtTop {
                            VStack {
                                profileHeader
                                Image(.banner)
                                    .resizable()
                                    .frame(height: 150)
                                    .transition(.opacity.combined(with: .move(edge: .top)))
                                    .padding(16)
                            }
                            .ignoresSafeArea()
                            .padding(.top, 40)
                            .background(RoundedRectangle(cornerRadius: 24).fill(Color.orange))
                            .transition(.opacity.combined(with: .move(edge: .top)))
                        }
                        contentList
                    }
                }
                .ignoresSafeArea()
                tabBarView
            }

            if isNotAtTop && !isScrollingDown && !isDetailViewActive {
                profileHeaderWhileScroling
                    .background(Color.white)
                    .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
        .animation(.easeInOut(duration: 0.3), value: isNotAtTop)
        .animation(.easeInOut(duration: 0.3), value: isScrollingDown)
    }

    private var profileHeader: some View {
        VStack(spacing: 0) {
            ProfileSection(data: viewModel.profileData)
            CustomTextField(
                text: $userInput,
                trailingIconOne: "magnifyingglass",
                trailingIconTwo: "mic.fill",
                onMicClick: {},
                onSearchClick: { _ in }
            )
            .padding(.top, 16)
        }
        .padding(16)
    }

    private var profileHeaderWhileScroling: some View {
        VStack(spacing: 0) {
            ProfileSection2(data: viewModel.profileData)
            CustomTextField(
                text: $userInput,
                trailingIconOne: "magnifyingglass",
                trailingIconTwo: "mic.fill",
                onMicClick: {},
                onSearchClick: { _ in }
            )
            .padding(.top, 16)
        }
        .padding(16)
    }

    private var contentList: some View {
        VStack(spacing: 8) {
            if let homeList = viewModel.homeCardData {
                ForEach(0..<homeList.count, id: \.self) { index in
                    getView(data: homeList[index])
                }
            }
        }
    }

    private func handleScroll(newOffset: CGFloat) {
        let scrollDelta = newOffset - lastScrollOffset
        isScrollingDown = scrollDelta < 0
        isNotAtTop = newOffset < 0
        lastScrollOffset = newOffset
    }

    @ViewBuilder
    func getView(data: HomeCard?) -> some View {
        if let data {
            VStack {
                if let title = data.title {
                    HStack {
                        Text(title.replacingOccurrences(of: "{0}", with: viewModel.profileData.name))
                            .foregroundColor(Color.black)
                            .font(.regular16Font)
                        Rectangle().fill(LinearGradient(colors: [Color.gray, Color.clear], startPoint: .leading, endPoint: .trailing))
                            .frame(height: 1)
                    }
                    .padding(16)
                }
                switch data.type {
                case .crousel:
                    Crousel(image: data.data as? [ImageResource] ?? [])
                case .filter:
                    FilterView(
                        details: data.data as? OneDeliveryData ?? OneDeliveryData(filterData: [], data: [], filterDataForBottom: []), isDetailViewActive: $isDetailViewActive)
                        .padding(16)
                case .foodList:
                    FoodListView(data: data.data as? [ImageResource] ?? [])
                case .quickPicks:
                    OneDeliveryView(details: data.data as? OneDeliveryData ?? OneDeliveryData(filterData: [], data: []))
                        .padding(16)
                case .whatsInYourMind:
                    WhatsInYourMindView(data1: data.data as? WhatsInYourMind ?? WhatsInYourMind(data: []))
                }
            }
        } else {
            EmptyView()
        }
    }
    private var tabBarView: some View {
        HStack {
            Spacer()
            TabButton(image: "house.fill", title: "Home", isSelected: selectedTab == 0) {
                selectedTab = 0
            }
            Spacer()
            TabButton(image: "birthday.cake", title: "Food", isSelected: selectedTab == 1) {
                selectedTab = 1
            }
            Spacer()
            TabButton(image: "square.and.arrow.down", title: "Eatlist", isSelected: selectedTab == 2) {
                selectedTab = 2
            }
            Spacer()
            TabButton(image: "creditcard.and.123", title: "Card", isSelected: selectedTab == 3) {
                selectedTab = 3
            }
            Spacer()
            TabButton(image: "arrow.3.trianglepath", title: "Reorder", isSelected: selectedTab == 4) {
                selectedTab = 4
            }
            Spacer()
        }
        .padding(4)
        .background(Color.white)
        .shadow(radius: 5)
        .ignoresSafeArea()
    }
    private struct TabButton: View {
        let image: String
        let title: String
        let isSelected: Bool
        let action: () -> Void
        
        var body: some View {
            VStack {
                Image(systemName: image)
                    .resizable()
                    .frame(width: 12, height: 12)
                    .foregroundColor(isSelected ? Color.orange : Color.gray)
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(isSelected ? Color.orange : Color.gray)
            }
        }
    }
}

#Preview {
    ContentView()
}
