//
//  ContentView.swift
//  ReviewPokemonHandsOn
//
//  Created by Yuchinante on 2025/03/21
//
//

import SwiftUI

struct PokemonListView: View {

    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {

                LazyVGrid(columns: GridItems.columns) {
                    ForEach(0..<151) { number in
                        Text("No.\(number)")
                            .frame(width: geometry.size.width / 2.1, height: 200)
                            .background() {
                                ZStack {
                                    Circle()
                                        .fill(Color.red)
                                        // ❌ エラー原因:
                                        // .frame(height: geometry.size / 2.1) のように
                                        // CGSize（geometry.size）をそのまま数値で割ろうとすると、
                                        // Swiftが型推論できずコンパイルエラーになる。
                                        //
                                        // ✅ 修正:
                                        // geometry.size.width など、CGFloat の値を明示的に使う。
                                        .frame(width: geometry.size.width / 2.1,
                                               height: geometry.size.width / 2.1
                                        )
                                    Rectangle()
                                        .fill(Color.white)
                                        .frame(width: geometry.size.width / 2)
                                        .offset(y: 50)
                                }
                            }
                            .overlay {
                                Circle()
                                    .stroke(Color.black,
                                            lineWidth: 1)
                            }
                    }
                }
            }
        }
    }
}

#Preview {
    PokemonListView()
}
