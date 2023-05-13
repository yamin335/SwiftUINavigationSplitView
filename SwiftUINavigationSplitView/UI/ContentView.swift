//
//  ContentView.swift
//  SwiftUINavigationSplitView
//
//  Created by Md. Yamin on 12.05.23.
//

import SwiftUI

let listOfSnacks: [FastFood] = [
    .init(name: "🍟 Fries"),
    .init(name: "🍔 Burger"),
    .init(name: "🍖 Kebab")
]

let listOfCloths: [Cloth] = [
    .init(name: "👕 Shirt"),
    .init(name: "👗 Dress"),
    .init(name: "🩳 Short")
]

struct ContentView: View {
    @State var selectedMenu: String?
    @State var menu: [String] = ["Yummy Foods 🍕", "Fashionable Cloths 🛍️"]
    
    var body: some View {
        NavigationSplitView {
            List(menu, id: \.self, selection: $selectedMenu, rowContent: Text.init)
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
//        .navigationDestination(for: Cloth.self) { clothItem in
//            ClothItemDetailsView(item: clothItem, path: $path)
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
