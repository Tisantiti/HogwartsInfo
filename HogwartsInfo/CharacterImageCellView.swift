//
//  CharacterImageCellView.swift
//  HogwartsInfo
//
//  Created by Santi Pérez on 12/3/23.
//

import SwiftUI

struct CharacterImageCellView: View {
    let character: CharacterHI
    let overlay: Bool
    
    init(character: CharacterHI, overlay: Bool = true) {
        self.character = character
        self.overlay = overlay
    }
    
    var body: some View {
        Group {
            if let urlImage = URL(string: character.image) {
                AsyncImage(url: urlImage) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 175)
                } placeholder: {
                    Image(systemName: "person.crop.artframe")
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .frame(width: 150, height: 175)
                }
            } else {
                Image(systemName: "person.crop.artframe")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .frame(width: 150, height: 175)
            }
        }
        .cornerRadius(10)
        .overlay(alignment: .bottom) {
            VStack(alignment: .leading) {
                Text(character.name)
                    .font(.caption)
                    .bold()
                    .foregroundColor(.white)
            }
            .padding(5)
            .padding(.bottom, 5)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background {
                Rectangle()
                    .fill(.white.opacity(0.4))
            }
            .opacity(overlay ? 1.0 : 0)
        }
    }
}

struct CharacterImageCellView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterImageCellView(character: .init(id: 1, name: "Harry James Potter", nickName: "Harry", studentAtHogwarts: true, hogwartsHouse: .gryffindor, actor: "Daniel Radcliffe", children: ["James Sirius Potter", "Albus Severus Potter", "Lily Luna Potter"], image: "https://raw.githubusercontent.com/fedeperin/harry-potter-api/main/imagenes/harry_potter.png"))
    }
}
