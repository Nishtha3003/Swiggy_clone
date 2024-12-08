//
//  ProfileSection.swift
//  Swiggy
//
//  Created by Nishtha Verma on 09/12/24.
//

import SwiftUI
import Foundation

struct ProfileSection: View {
    let data: ProfileData
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 0){
                HStack(spacing: 0) {
                    Image(systemName: "location.fill")
                        .foregroundColor(Color.white)
                    Text(data.title)
                        .foregroundColor(Color.white)
                        .font(.bold16Font)
                        .padding(.leading, 4)
                    Image(systemName: "chevron.down")
                        .foregroundColor(Color.white.opacity(0.6))
                        .frame(width: 8, height: 8)
                        .padding(.leading, 4)
                }
                Text(data.address)
                    .foregroundColor(Color.white)
                    .font(.regular16Font)
                    .lineLimit(1)
            }
            Spacer()
            Image(systemName: "person.crop.circle.fill")
                .foregroundColor(Color.white)
                .frame(width: 32, height: 32)
        }
    }
}

struct ProfileSection2: View {
    let data: ProfileData
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 0){
                HStack(spacing: 0) {
                    Image(systemName: "location.fill")
                        .foregroundColor(Color.black)
                    Text(data.title)
                        .foregroundColor(Color.black)
                        .font(.bold16Font)
                        .padding(.leading, 4)
                    Image(systemName: "chevron.down")
                        .foregroundColor(Color.black.opacity(0.6))
                        .frame(width: 8, height: 8)
                        .padding(.leading, 4)
                }
                Text(data.address)
                    .foregroundColor(Color.black)
                    .font(.regular16Font)
                    .lineLimit(1)
            }
            Spacer()
            Image(systemName: "person.crop.circle.fill")
                .foregroundColor(Color.black)
                .frame(width: 32, height: 32)
        }
    }
}

