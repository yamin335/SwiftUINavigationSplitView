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
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection.animation(.easeOut)){
            TwoColumnSplitView().tabItem {
                Label("Two Column", systemImage: "rectangle.trailinghalf.inset.filled")
            }
            .tag(0)
            
            ThreeColumnSplitView().tabItem {
                Label("Three Column", systemImage: "rectangle.trailingthird.inset.filled")
            }
            .tag(1)
        }.accentColor(.red).edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
