//
//  Untitled.swift
//  ReviewPokemonHandsOn
//  
//  Created by Yuchinante on 2025/03/22
//  
//

import SwiftUI

struct GridItems {

    // ポケモンボールを2列にするためのGridItem
    static var columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 10, alignment: .center), count: 2)
}
