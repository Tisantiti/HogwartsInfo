//
//  HomeListView.swift
//  HogwartsInfo
//
//  Created by Santi Pérez on 6/3/23.
//

import SwiftUI

struct SpellsListView: View {
    @EnvironmentObject var hogwartsInfoVM: HogwartsInfoVM
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(hogwartsInfoVM.spells) { spell in
                    SpellCellView(spell: spell)
                }
            }
            .scrollIndicators(.hidden)
            .refreshable {
                await hogwartsInfoVM.getSpells()
            }
            .navigationTitle("Spells")
        }
        .overlay {
            if hogwartsInfoVM.initialLoading {
                LoadingView()
                    .transition(.opacity)
            }
        }
    }
}

struct SpellsListView_Previews: PreviewProvider {
    static var previews: some View {
        SpellsListView()
    }
}
