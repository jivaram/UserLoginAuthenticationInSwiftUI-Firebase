//
//  ItemListView.swift
//  YashEngineering
//
//  Created by Jiva Ram on 19/05/25.
//

import SwiftUI

struct ItemListView: View {
    var body: some View {
        HStack {
           ZStack {
               Image("logoImage")
                   .resizable()
                   .scaledToFill()
                   .frame(width: .infinity, height: 200)
                   .cornerRadius(20)
           }
            
       }
       .padding()
       .background(Color("primary"))
    }
}

#Preview {
    ItemListView()
}
