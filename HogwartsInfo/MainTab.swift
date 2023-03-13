//
//  MainTab.swift
//  HogwartsInfo
//
//  Created by Santi Pérez on 6/3/23.
//

import SwiftUI

struct MainTab: View {
    @EnvironmentObject var hogwartsInfoVM: HogwartsInfoVM
    
    var body: some View {
        TabView {
            SpellsListView()
                .tabItem {
                    Label("Spells", systemImage: "lasso.and.sparkles")
                }
                .onAppear {
                    if hogwartsInfoVM.spells.isEmpty {
                        Task {
                            await hogwartsInfoVM.getSpells()
                        }
                    }
                }
            BooksListView()
                .tabItem {
                    Label("Books", systemImage: "books.vertical")
                }
                .onAppear {
                    if hogwartsInfoVM.books.isEmpty {
                        Task {
                            await hogwartsInfoVM.getBooks()
                        }
                    }
                }
            CharactersListView()
                .tabItem {
                    Label("Characters", systemImage: "person.2.circle")
                }
                .onAppear {
                    if hogwartsInfoVM.characters.isEmpty {
                        Task {
                            await hogwartsInfoVM.getCharacters()
                        }
                    }
                }
            AdditionalInfoListView()
                .tabItem {
                    Label("Additional Info", systemImage: "info.circle")
                }
                .onAppear {
                    if hogwartsInfoVM.additionalsInfo.isEmpty {
                        Task {
                            await hogwartsInfoVM.getAdditionalsInfo()
                        }
                    }
                }
        }
        .alert("Error de carga",
               isPresented: $hogwartsInfoVM.showAlert) {
            Button(action: {}, label: { Text("OK") })
        } message: {
            Text(hogwartsInfoVM.errorMsg)
        }
    }
}

struct MainTab_Previews: PreviewProvider {
    static var previews: some View {
        MainTab()
    }
}

