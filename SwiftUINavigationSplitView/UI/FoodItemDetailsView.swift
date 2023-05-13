//
//  FoodItemDetailsView.swift
//  SwiftUINavigationSplitView
//
//  Created by Md. Yamin on 13.05.23.
//

import SwiftUI

struct BackButton: View {
    let label: String
    
    var body: some View {
        Text(label)
            .font(.system(size: 14, weight: .regular))
            .foregroundColor(.blue)
            .padding(.horizontal, 15)
            .padding(.vertical, 6)
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 5, style: .circular)
                    .stroke(.blue, lineWidth: 1)
            )
    }
}

struct RelatedListItem: View {
    let label: String
    
    var body: some View {
        Text(label)
            .font(.system(size: 24, weight: .regular))
            .foregroundColor(.blue)
            .padding(.horizontal, 15)
            .padding(.vertical, 6)
            .frame(width: 100, height: 100)
            .background(
                RoundedRectangle(cornerRadius: 5, style: .circular)
                    .stroke(.blue, lineWidth: 1)
            )
    }
}

struct FoodItemDetailsView: View {
    let item: FastFood
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack {
            Text(item.name)
                .font(.system(size: 60, weight: .black))
                .padding(.top, 40)
            
            Text("Related food Items")
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
            
            Button(action: {
                while path.count > 0 {
                    path.removeLast()
                }
            }) {
                BackButton(label: "Back to the list")
            }.padding(40)
            
            Spacer()
        }.padding()
    }
}

struct FoodItemDetailsView_Previews: PreviewProvider {
    @State static var path = NavigationPath()
    static var previews: some View {
        FoodItemDetailsView(item: .init(name: "🍟 Fries"), path: $path)
    }
}
