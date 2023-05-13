//
//  DataModels.swift
//  SwiftUINavigationSplitView
//
//  Created by Md. Yamin on 13.05.23.
//

struct FastFood: Identifiable, Hashable {
    let name: String
    var id: String {name}
}

struct Cloth: Identifiable, Hashable {
    let name: String
    var id: String {name}
}
