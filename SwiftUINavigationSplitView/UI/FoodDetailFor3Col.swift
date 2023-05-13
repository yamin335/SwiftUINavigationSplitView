//
//  FoodDetailFor3Col.swift
//  SwiftUINavigationSplitView
//
//  Created by Md. Yamin on 13.05.23.
//

import SwiftUI

struct FoodDetailFor3Col: View {
    let item: FastFood
    @Binding var path: NavigationPath
    
    var body: some View {
        NavigationStack(path: $path.animation(.easeOut)) {
            VStack {
                Text(item.name)
                    .font(.system(size: 60, weight: .black))
                    .padding(.top, 40)
                
                Text("Related food items")
                    .padding(.top, 40)

                HStack {
                    ForEach(Array(listOfSnacks.enumerated()), id: \.offset) { index, item in
                        Button(action: {
                            path.append(item)
                        }) {
                            RelatedListItem(label: item.name)
                        }
                    }
                }
                
                Spacer()
            }.navigationTitle("\(item.name) details")
            .padding(.horizontal, 20)
            .padding(.vertical, 15)
            .navigationDestination(for: FastFood.self) { foodItem in
                FoodItemDetailsView(item: foodItem, path: $path)
            }
        }
    }
}

struct FoodDetailFor3Col_Previews: PreviewProvider {
    @State static var path = NavigationPath()
    static var previews: some View {
        FoodDetailFor3Col(item: .init(name: "🍟 Fries"), path: $path)
    }
}
