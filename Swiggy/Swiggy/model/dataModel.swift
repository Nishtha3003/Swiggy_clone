//
//  dataModel.swift
//  Swiggy
//
//  Created by Nishtha Verma on 09/12/24.
//

import SwiftUI
import Foundation

struct OneDeliveryData: Hashable {
    let filterData: [FilterData]
    let data: [OneDeliveryDetail]
    var filterDataForBottom: [FilterData2]? = nil
}
struct FilterData: Hashable {
    let title: String
    let isSelected: Bool
}
struct OneDeliveryDetail: Hashable {
    let image: ImageResource
    let discount: String
    let discountDetail: String
    let title: String
    let rating: Float
    let deliveryTime: String
    let category: String
    let isFavroite: Bool
}

struct HomeCard: Equatable {
    static func == (lhs: HomeCard, rhs: HomeCard) -> Bool {
        return true
    }
    var type: HomeCardType
    var order: Int
    var data: Any
    var title: String?
}

struct WhatsInYourMind: Hashable {
    var data: [WhatsInYourMindData]
}
struct WhatsInYourMindData: Hashable {
    var imageUrl: ImageResource
    var title: String
}
enum HomeCardType: CaseIterable, Hashable {
    case crousel
    case filter
    case foodList
    case quickPicks
    case whatsInYourMind
}

struct FilterData2: Hashable {
    var title: String
    var leadingIcon: String?
    var endIcon: String?
}

struct ProfileData {
    var name: String
    var title: String
    var address: String
}
