//
//  CharacterDetailView.swift
//  HogwartsInfo
//
//  Created by Santi Pérez on 12/3/23.
//

import SwiftUI

struct CharacterDetailView: View {
    @StateObject var viewModel: CharacterDetailVM = CharacterDetailVM()
    let id: Int
    
    var body: some View {
        Group {
            if let character = viewModel.character, !viewModel.showAlert {
                ScrollView(showsIndicators: false) {
                    VStack {
                        CharacterImageCellView(character: character, overlay: false)
                            .clipped()
                        Spacer()
                        contentCharacter(character: character)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding()
                    .navigationTitle(character.name)
                }
                .modifier(HouseBackgroundViewModifier(house: viewModel.character?.hogwartsHouse))
            } else if viewModel.showAlert {
                ErrorView(errorMessage: viewModel.errorMsg)
            } else {
                LoadingView()
                    .task {
                        await viewModel.getCharacterHI(id: id)
                    }
            }
        }
        .modifier(AlertErrorViewModifier(showAlert: $viewModel.showAlert, errorMsg: $viewModel.errorMsg))
        .refreshable {
            await viewModel.getCharacterHI(id: id)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func contentCharacter(character: CharacterHI) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Name:")
                .bold()
            Text(character.name)
                .italic()
            Text("Nickname:")
                .bold()
            Text(character.nickName)
                .italic()
            if character.studentAtHogwarts {
                Text("Hogwarts house:")
                    .bold()
                Text(character.hogwartsHouse.rawValue.capitalized)
                    .italic()
            }
            if !character.children.isEmpty {
                VStack(alignment: .leading) {
                    Text("Childrens: ")
                        .bold()
                    VStack(alignment: .leading, spacing: 1) {
                        ForEach(character.children, id: \.self) { children in
                            HStack {
                                Image(systemName: "arrowtriangle.right.fill")
                                    .resizable()
                                    .frame(width: 5, height: 5)
                                Text(children)
                                    .font(.caption2)
                                    .italic()
                            }
                            .padding(5)
                        }
                    }
                    .border(.black)
                    .padding(.leading, 10)
                }
            }
            Text("Actor:")
                .bold()
            Text(character.actor)
                .font(.caption2)
                .italic()
        }
        .padding(10)
        .frame(maxWidth: .infinity, alignment: .leading)
        .font(.caption)
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        //        CharacterDetailView(character: .init(id: 1, name: "Harry James Potter", nickName: "Harry", studentAtHogwarts: true, hogwartsHouse: .gryffindor, actor: "Daniel Radcliffe", children: ["James Sirius Potter", "Albus Severus Potter", "Lily Luna Potter"], image: "https://raw.githubusercontent.com/fedeperin/harry-potter-api/main/imagenes/harry_potter.png"))
        CharacterDetailView(id: 1)
    }
}
