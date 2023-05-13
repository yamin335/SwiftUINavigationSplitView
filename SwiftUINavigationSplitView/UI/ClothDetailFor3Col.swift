//
//  ClothDetailFor3Col.swift
//  SwiftUINavigationSplitView
//
//  Created by Md. Yamin on 13.05.23.
//

import SwiftUI

struct ClothDetailFor3Col: View {
    let item: Cloth
    @Binding var path: NavigationPath
    
    var body: some View {
        NavigationStack(path: $path.animation(.easeOut)) {
            VStack {
                Text(item.name)
                    .font(.system(size: 60, weight: .black))
                    .padding(.top, 40)
                
                Text("Related fashionable items")
                    .padding(.top, 40)

                HStack {
                    ForEach(Array(listOfCloths.enumerated()), id: \.offset) { index, item in
                        NavigationLink(value: item) {
                            RelatedListItem(label: item.name)
                        }
                    }
                }
                
                Spacer()
            }.navigationTitle("\(item.name) details")
            .padding(.horizontal, 20)
            .padding(.vertical, 15)
            .navigationDestination(for: Cloth.self) { clothItem in
                ClothItemDetailsView(item: clothItem, path: $path)
            }
        }
    }
}

struct ClothDetailFor3Col_Previews: PreviewProvider {
    @State static var path = NavigationPath()
    static var previews: some View {
        ClothDetailFor3Col(item: .init(name: "👕 Shirt"), path: $path)
    }
}
