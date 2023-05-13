//
//  TwoColumnSplitView.swift
//  SwiftUINavigationSplitView
//
//  Created by Md. Yamin on 13.05.23.
//

import SwiftUI

struct TwoColumnSplitView: View {
    @State var selectedMenu: String?
    @State var menu: [String] = ["Yummy Foods 🍕", "Fashionable Cloths 🛍️"]
    @State private var columnVisibility =
    NavigationSplitViewVisibility.doubleColumn
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility.animation(.easeOut)) {
            List(menu, id: \.self, selection: $selectedMenu.animation(.easeOut), rowContent: Text.init)
                .navigationSplitViewColumnWidth(220)
        } detail: {
            if let item = selectedMenu {
                if item == menu[0] {
                    FoodItemListView()
                } else {
                    ClothItemListView()
                }
            } else {
                Text("Please select an item to show")
            }
        }
        .navigationSplitViewStyle(.balanced)
    }
}

struct TwoColumnSplitView_Previews: PreviewProvider {
    static var previews: some View {
        TwoColumnSplitView()
    }
}
