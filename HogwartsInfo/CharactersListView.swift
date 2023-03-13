//
//  CharactersListView.swift
//  HogwartsInfo
//
//  Created by Santi Pérez on 12/3/23.
//

import SwiftUI

struct CharactersListView: View {
    @EnvironmentObject var hogwartsInfoVM: HogwartsInfoVM
    let columns = [GridItem(.adaptive(minimum: 150, maximum: 150))]
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                if !hogwartsInfoVM.characters.isEmpty {
                    LazyVGrid(columns: columns) {
                        ForEach(hogwartsInfoVM.characters) { character in
                            NavigationLink(value: character) {
                                CharacterImageCellView(character: character)
                            }
                        }
                    }
                    .navigationDestination(for: CharacterHI.self) { character in
                        CharacterDetailView(id: character.id)
                    }
                    .padding(.horizontal)
                } else {
                    VStack(alignment: .center) {
                        Text(hogwartsInfoVM.errorMsg)
                    }
                }
            }
            .refreshable {
                await hogwartsInfoVM.getCharacters()
            }
            .navigationTitle("Characters")
        }
        .overlay {
            if hogwartsInfoVM.initialLoading {
                LoadingView()
                    .transition(.opacity)
            }
        }
    }
}

struct CharactersListView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersListView()
    }
}
