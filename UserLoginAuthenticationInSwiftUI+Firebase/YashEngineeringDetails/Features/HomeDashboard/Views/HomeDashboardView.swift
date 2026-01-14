//
//  HomeDashboardView.swift
//  YashEngineering
//
//  Created by Jiva Ram on 19/05/25.
//

import SwiftUI

struct HomeDashboardView: View {
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("Welcome To Yash Engineering")
                        .font(.system(size: 28, weight: .bold, design: .default))
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        .safeAreaPadding(.all)
                    Button(action: {
                        if let url = URL(string: "tel://8218916708") {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        HStack {
                            Image(systemName: "phone.fill")
                                .foregroundColor(.red)
                                .font(.system(size: 22))
                                .safeAreaPadding(.leading)
                            Text("+91 8218916708")
                                .font(.system(size: 25,
                                              weight: .bold,
                                              design: .default)
                                )
                                .foregroundStyle(.red)
                            Spacer()
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                Spacer()
                Image("logoImage1")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(.circle)
                    .safeAreaPadding(.trailing)
                
            }
            List {
                ForEach(0..<10, id: \.self) { _ in
                    ItemListView()
                        .listRowInsets(EdgeInsets())
                }
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            Spacer()
        }
        .background(Color("primary").ignoresSafeArea(.container, edges: [.top]))
    }
}

#Preview {
    HomeDashboardView()
}
