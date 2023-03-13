//
//  CharacterDetailVM.swift
//  HogwartsInfo
//
//  Created by Santi Pérez on 12/3/23.
//

import Foundation
import SwiftUI

@MainActor
final class CharacterDetailVM: ObservableObject {
    
    let persistence = NetworkPersistence.shared
    var loading: Bool = false
    @Published var character: CharacterHI?
    
    @Published var showAlert = false
    @Published var errorMsg = ""
    
    nonisolated init() { }
    
}

extension CharacterDetailVM {
    public func getCharacterHI(id: Int) async {
        if !loading {
            do {
                loading = true
                self.character = try await persistence.getCharacter(id: id)
                loading = false
            } catch let error as NetworkError {
                errorMsg = error.description
                showAlert.toggle()
                loading = false
            } catch {
                errorMsg = error.localizedDescription
                showAlert.toggle()
                loading = false
            }
            
        }
    }
}
