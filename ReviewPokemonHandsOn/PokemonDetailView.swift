//
//  Untitled.swift
//  ReviewPokemonHandsOn
//  
//  Created by Yuchinante on 2025/03/22
//  
//

import SwiftUI

// pokemonListViewのポケモンをタップした時に遷移する画面
struct PokemonDetailView: View {
    var pokemon: PokemonEntity

    var body: some View {
        // idを表示
        Text("No. \(pokemon.id)")
            .font(.title)
            .fontWeight(.semibold)
        // 非同期でロードする画像を表示
        AsyncImage(url: URL(string: pokemon.sprites.frontImage)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
        } placeholder: {
            ProgressView()
        }
        // ポケモンの名前を表示
        Text(pokemon.name)
            .font(.body)
            .fontWeight(.bold)
        // ポケモンのタイプを表示
        Text("\(pokemon.types[0].type.name)タイプ")
            .font(.body)
            .fontWeight(.bold)
    }
}
