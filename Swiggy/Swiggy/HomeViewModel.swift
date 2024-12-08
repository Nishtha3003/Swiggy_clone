//
//  HomeViewModel.swift
//  Swiggy
//
//  Created by Nishtha Verma on 08/12/24.
//

import SwiftUI
import Foundation

class HomeViewModel: ObservableObject {
    var profileData: ProfileData = ProfileData(name:"Nishtha", title: "Office", address: "Block 1st Floor Swiggy Embassy Tech Village")
    var crouselImage: [ImageResource]  = [.banner, .banner, .banner]
    var imageResources: [ImageResource] = [.coffee1, .coffee2, .coffee3, .coffee4, .coffee5, .coffee6]
    var whatsInYourMind: WhatsInYourMind = WhatsInYourMind( data: [
        WhatsInYourMindData(imageUrl: .coffee1, title: "Burger"),
        WhatsInYourMindData(imageUrl: .coffee2, title: "Burger"),
        WhatsInYourMindData(imageUrl: .coffee3, title: "Burger"),
        WhatsInYourMindData(imageUrl: .coffee4, title: "Burger"),
        WhatsInYourMindData(imageUrl: .coffee5, title: "Burger"),
        WhatsInYourMindData(imageUrl: .coffee6, title: "Burger"),
        WhatsInYourMindData(imageUrl: .coffee1, title: "Burger"),
        WhatsInYourMindData(imageUrl: .coffee3, title: "Burger"),
        WhatsInYourMindData(imageUrl: .coffee1, title: "Burger"),
        WhatsInYourMindData(imageUrl: .coffee2, title: "Burger"),
        WhatsInYourMindData(imageUrl: .coffee3, title: "Burger"),
        WhatsInYourMindData(imageUrl: .coffee4, title: "Burger"),
        WhatsInYourMindData(imageUrl: .coffee5, title: "Burger"),
        WhatsInYourMindData(imageUrl: .coffee6, title: "Burger"),
        WhatsInYourMindData(imageUrl: .coffee1, title: "Burger"),
        WhatsInYourMindData(imageUrl: .coffee3, title: "Burger"),
    ])
    var oneDeliveryData =  OneDeliveryData(filterData: [
        FilterData(title: "Your Order", isSelected: true),
        FilterData(title: "Your Eatlists", isSelected: false),
        FilterData(title: "Favourites", isSelected: false)
    ], data: [
        OneDeliveryDetail(image: .coffee1, discount: "125 off", discountDetail: "Above 1199", title: "Dominoes Pizza", rating: 4.3, deliveryTime: "20-25 min", category: "Pizzas", isFavroite: true),
        OneDeliveryDetail(image: .coffee6, discount: "125 off", discountDetail: "Above 1199", title: "Dominoes Pizza", rating: 4.3, deliveryTime: "20-25 min", category: "Pizzas", isFavroite: false),
        OneDeliveryDetail(image: .coffee4, discount: "125 off", discountDetail: "Above 1199", title: "Dominoes Pizza", rating: 4.3, deliveryTime: "20-25 min", category: "Pizzas", isFavroite: false),
        OneDeliveryDetail(image: .coffee1, discount: "125 off", discountDetail: "Above 1199", title: "Dominoes Pizza", rating: 4.3, deliveryTime: "20-25 min", category: "Pizzas", isFavroite: true),
        OneDeliveryDetail(image: .coffee6, discount: "125 off", discountDetail: "Above 1199", title: "Dominoes Pizza", rating: 4.3, deliveryTime: "20-25 min", category: "Pizzas", isFavroite: false),
        OneDeliveryDetail(image: .coffee4, discount: "125 off", discountDetail: "Above 1199", title: "Dominoes Pizza", rating: 4.3, deliveryTime: "20-25 min", category: "Pizzas", isFavroite: false),
        OneDeliveryDetail(image: .coffee1, discount: "125 off", discountDetail: "Above 1199", title: "Dominoes Pizza", rating: 4.3, deliveryTime: "20-25 min", category: "Pizzas", isFavroite: true),
        OneDeliveryDetail(image: .coffee6, discount: "125 off", discountDetail: "Above 1199", title: "Dominoes Pizza", rating: 4.3, deliveryTime: "20-25 min", category: "Pizzas", isFavroite: false),
        OneDeliveryDetail(image: .coffee4, discount: "125 off", discountDetail: "Above 1199", title: "Dominoes Pizza", rating: 4.3, deliveryTime: "20-25 min", category: "Pizzas", isFavroite: false)
        
    ])
    var oneDeliveryDataFilter =  OneDeliveryData(filterData: [
        FilterData(title: "Your Order", isSelected: true),
        FilterData(title: "Your Eatlists", isSelected: false),
        FilterData(title: "Favourites", isSelected: false)
    ], data: [
        OneDeliveryDetail(image: .coffee1, discount: "125 off", discountDetail: "Above 1199", title: "Dominoes Pizza", rating: 4.3, deliveryTime: "20-25 min", category: "Pizzas", isFavroite: true),
        OneDeliveryDetail(image: .coffee6, discount: "125 off", discountDetail: "Above 1199", title: "Dominoes Pizza", rating: 4.3, deliveryTime: "20-25 min", category: "Pizzas", isFavroite: false),
        OneDeliveryDetail(image: .coffee4, discount: "125 off", discountDetail: "Above 1199", title: "Dominoes Pizza", rating: 4.3, deliveryTime: "20-25 min", category: "Pizzas", isFavroite: false),
        OneDeliveryDetail(image: .coffee1, discount: "125 off", discountDetail: "Above 1199", title: "Dominoes Pizza", rating: 4.3, deliveryTime: "20-25 min", category: "Pizzas", isFavroite: true),
        OneDeliveryDetail(image: .coffee6, discount: "125 off", discountDetail: "Above 1199", title: "Dominoes Pizza", rating: 4.3, deliveryTime: "20-25 min", category: "Pizzas", isFavroite: false),
        OneDeliveryDetail(image: .coffee4, discount: "125 off", discountDetail: "Above 1199", title: "Dominoes Pizza", rating: 4.3, deliveryTime: "20-25 min", category: "Pizzas", isFavroite: false),
        OneDeliveryDetail(image: .coffee1, discount: "125 off", discountDetail: "Above 1199", title: "Dominoes Pizza", rating: 4.3, deliveryTime: "20-25 min", category: "Pizzas", isFavroite: true),
        OneDeliveryDetail(image: .coffee6, discount: "125 off", discountDetail: "Above 1199", title: "Dominoes Pizza", rating: 4.3, deliveryTime: "20-25 min", category: "Pizzas", isFavroite: false),
        OneDeliveryDetail(image: .coffee4, discount: "125 off", discountDetail: "Above 1199", title: "Dominoes Pizza", rating: 4.3, deliveryTime: "20-25 min", category: "Pizzas", isFavroite: false)
        
    ],filterDataForBottom: [
        FilterData2(title: "Filter", leadingIcon: nil, endIcon: "line.3.horizontal.decrease.circle"),
        FilterData2(title: "SortBy", leadingIcon: nil, endIcon:"chevron.down"),
        FilterData2(title: "Fast Delivery", leadingIcon: "hare.fill", endIcon: nil),
        FilterData2(title: "Filter", leadingIcon: "line.3.horizontal.decrease.circle", endIcon: nil),
        FilterData2(title: "Filter", leadingIcon: "line.3.horizontal.decrease.circle", endIcon: nil),
    ])
    
    @Published var homeCardData: [HomeCard]?
    
    init() {
        mergeResponse()
    }
    
    
    func mergeResponse() {
        self.homeCardData = [
            HomeCard(type: .crousel, order: 0, data: crouselImage, title: nil),
            HomeCard(type: .foodList, order: 2, data: imageResources, title: nil),
            HomeCard(type: .whatsInYourMind, order: 3, data: whatsInYourMind, title: "{0} Whats in your mind"),
            HomeCard(type: .quickPicks, order: 4, data: oneDeliveryData, title: "Quick Picks For You"),
            HomeCard(type: .filter, order: 1, data: oneDeliveryDataFilter, title: nil),
        ]
    }
    
}

