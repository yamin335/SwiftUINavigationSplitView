//
//  ThreeColumnSplitView.swift
//  SwiftUINavigationSplitView
//
//  Created by Md. Yamin on 13.05.23.
//

import SwiftUI

struct ThreeColumnSplitView: View {
    @State var itemType: String?
    @State var typeMenu: [String] = ["Yummy Foods 🍕", "Fashionable Cloths 🛍️"]
    @State private var columnVisibility =
    NavigationSplitViewVisibility.all
    @State var path1: NavigationPath = .init()
    @State var path2: NavigationPath = .init()
    @State var selectedFood: FastFood?
    @State var selectedCloth: Cloth?
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility.animation(.easeOut)) {
            List(typeMenu, id: \.self, selection: $itemType.animation(.easeOut), rowContent: Text.init)
                .navigationSplitViewColumnWidth(220)
        } content: {
            if let item = itemType {
                if item == typeMenu[0] {
                    List(listOfSnacks, id: \.self, selection: $selectedFood.animation(.easeOut)) { foodItem in
                        ListItem(label: foodItem.name)
                    }
                } else {
                    List(listOfCloths, id: \.self, selection: $selectedCloth.animation(.easeOut)) { clothItem in
                        ListItem(label: clothItem.name)
                    }
                }
            } else {
                Text("Please select an item type to show")
            }
        } detail: {
            if let itemType = itemType {
                if let foodItem = selectedFood, itemType == typeMenu[0] {
                    FoodDetailFor3Col(item: foodItem, path: $path1)
                } else if let clothItem = selectedCloth, itemType == typeMenu[1] {
                    ClothDetailFor3Col(item: clothItem, path: $path2)
                } else {
                    Text("Please select an item to show")
                }
            } else {
                Text("Please select an item to show")
            }
        }
        .navigationSplitViewStyle(.balanced)
    }
}

struct ThreeColumnSplitView_Previews: PreviewProvider {
    static var previews: some View {
        ThreeColumnSplitView()
    }
}
