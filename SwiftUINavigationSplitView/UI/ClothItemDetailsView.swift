//
//  ClothItemDetailsView.swift
//  SwiftUINavigationSplitView
//
//  Created by Md. Yamin on 13.05.23.
//

import SwiftUI

struct ClothItemDetailsView: View {
    let item: Cloth
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack {
            Text(item.name)
                .font(.system(size: 60, weight: .black))
                .padding(.top, 40)
            
            Text("Related fashionable Items")
                .padding(.top, 40)

            HStack {
                ForEach(Array(listOfCloths.enumerated()), id: \.offset) { index, item in
                    NavigationLink(value: item) {
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

struct ClothItemDetailsView_Previews: PreviewProvider {
    @State static var path = NavigationPath()
    static var previews: some View {
        ClothItemDetailsView(item: .init(name: "👕 Shirt"), path: $path)
    }
}
