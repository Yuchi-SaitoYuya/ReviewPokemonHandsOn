//
//  ContentView.swift
//  ReviewPokemonHandsOn
//
//  Created by Yuchinante on 2025/03/21
//
//

import SwiftUI

struct PokemonListView: View {
    @StateObject var ViewModel = PokemonListViewModel() // ViewModelを状態付きで保持（画面のライフサイクルに合わせて管理）
    var body: some View { // ViewのUI構成を記述するbodyプロパティ
        NavigationStack { // 画面遷移のためのナビゲーションスタックを定義（NavigationLinkと連動）
            GeometryReader { geometry in // 親ビューのサイズ情報を取得するためのコンテナ
                ScrollView(.vertical) { // 縦方向のスクロールビューでコンテンツをスクロール可能にする
                    LazyVGrid(columns: GridItems.columns) { // グリッドレイアウトを定義
                        ForEach(ViewModel.pokemonListEntity) { pokemon in // ViewModelから取得したポケモン一覧をループ表示
                            NavigationLink { // タップ時に詳細画面へ遷移するリンクを作成
                                PokemonDetailView(pokemon: pokemon) // 遷移先の詳細画面に選択したポケモンを渡す
                            } label: { // リンクの見た目（ラベル）を定義
                                AsyncImage(url: URL(string: pokemon.sprites.frontImage)) { image in // 非同期に画像を読み込んで表示
                                    image
                                        .image? // 読み込みに成功した画像を取得（Optionalなので?付き）
                                        .resizable() // 画像サイズをリサイズ可能にする
                                        .aspectRatio(contentMode: .fit) // アスペクト比を維持してフィットさせる
                                        .frame(height: geometry.size.width / 3) // 画像の高さを画面幅の3分の1に設定
                                }
                            }
                            .frame(width: geometry.size.width / 2.1, height: 200) // 各セルのサイズを設定（2列表示を意識）
                            .background() { // 背景にカスタムデザインを追加
                                ZStack { // 複数のビューを重ねるためのコンテナ
                                    Circle() // 赤い円を表示（モンスターボールの上半分をイメージ）
                                        .fill(Color.red) // 赤色で塗りつぶし
                                        .frame(width: geometry.size.width / 2.1, // 円の幅と高さを設定
                                               height: geometry.size.width / 2.1 // ※ 修正済み：geometry.size は構造体なので .width を明示
                                        )
                                    Rectangle() // 白い四角（モンスターボールの下半分）
                                        .fill(Color.white) // 白色で塗りつぶし
                                        .frame(width: geometry.size.width / 2, height: 100) // 四角の幅を設定（赤い円より少し大きめ）
                                        .offset(y: 50) // 少し下にずらして赤い円の下に配置
                                }
                            }
                            .overlay { // 外枠の装飾として円形の線を追加
                                Circle() // 円形の枠線
                                    .stroke(Color.black, // 線の色を黒に設定
                                            lineWidth: 1) // 線の太さを1に設定
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview { // SwiftUIのプレビュー機能（Xcodeで画面の見た目を確認できる）
    PokemonListView() // プレビュー対象のViewを指定
}
