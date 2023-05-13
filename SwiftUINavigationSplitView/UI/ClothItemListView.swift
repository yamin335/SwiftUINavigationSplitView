//
//  ClothItemListView.swift
//  SwiftUINavigationSplitView
//
//  Created by Md. Yamin on 13.05.23.
//

import SwiftUI

struct ClothItemListView: View {
    static let tag = "ClothItemListView"
    @State var path: NavigationPath = .init()
    
    var body: some View {
        NavigationStack(path: $path.animation(.easeOut)) {
            VStack {
                ForEach(Array(listOfCloths.enumerated()), id: \.offset) { index, item in
                    NavigationLink(value: item) {
                        ListItem(label: item.name)
                    }
                }
            }.navigationTitle("Fashionable Cloths 🛍️")
            .padding(.horizontal, 20)
            .padding(.vertical, 15)
            .navigationDestination(for: Cloth.self) { clothItem in
                ClothItemDetailsView(item: clothItem, path: $path)
            }
        }
    }
}

struct ClothItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ClothItemListView()
    }
}
