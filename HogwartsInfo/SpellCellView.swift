//
//  SpellCellView.swift
//  HogwartsInfo
//
//  Created by Santi Pérez on 6/3/23.
//

import SwiftUI

struct SpellCellView: View {
    let spell: Spell
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("\(spell.name)")
                .font(.body)
                .bold()
                .underline()
            HStack {
                Image(systemName: "sparkles")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15)
                Text("\(spell.usage)")
                    .font(.footnote)
            }
        }
    }
}

struct SpellCellView_Previews: PreviewProvider {
    static var previews: some View {
        SpellCellView(spell: .init(id: 1, name: "Alojomora", usage: "Abre las cerraduras"))
    }
}
