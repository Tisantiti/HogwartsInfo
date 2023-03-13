//
//  HogwartsInfoVM.swift
//  HogwartsInfo
//
//  Created by Santi Pérez on 6/3/23.
//

import Foundation

@MainActor
final class HogwartsInfoVM:ObservableObject {
    
    let persistence = NetworkPersistence.shared
    
    @Published var spells:Spells
    @Published var books:Books
    @Published var characters: CharactersHI
    @Published var additionalsInfo: AdditionalsInfo

    @Published var showAlert = false
    @Published var errorMsg = ""
    
    @Published var initialLoading = true
    
    init(spells: Spells = [], books: Books = [], characters: CharactersHI = [], additionalsInfo: AdditionalsInfo = []) {
        self.spells = spells
        self.books = books
        self.characters = characters
        self.additionalsInfo = additionalsInfo
        if !spells.isEmpty, !books.isEmpty, !characters.isEmpty, !additionalsInfo.isEmpty { initialLoading = false }
    }
    
    func getData() async {
        do {
            (self.spells, self.books, self.characters, self.additionalsInfo) = try await (persistence.getSpells(), persistence.getBooks(), persistence.getCharacters(), persistence.getAdditionalsInfo())
            if initialLoading { initialLoading.toggle() }
        } catch let error as NetworkError {
            errorMsg = error.description
            showAlert.toggle()
        } catch {
            errorMsg = error.localizedDescription
            showAlert.toggle()
        }
    }
    
    func getSpells() async {
        do {
            initialLoading = true
            self.spells = try await persistence.getSpells()
            if initialLoading { initialLoading.toggle() }
        } catch let error as NetworkError {
            errorMsg = error.description
            showAlert.toggle()
        } catch {
            errorMsg = error.localizedDescription
            showAlert.toggle()
        }
        if initialLoading { initialLoading.toggle() }
    }
    
    func getBooks() async {
        do {
            initialLoading = true
            self.books = try await persistence.getBooks()
            if initialLoading { initialLoading.toggle() }
        } catch let error as NetworkError {
            errorMsg = error.description
            showAlert.toggle()
        } catch {
            errorMsg = error.localizedDescription
            showAlert.toggle()
        }
        if initialLoading { initialLoading.toggle() }
    }
    
    func getCharacters() async {
        do {
            self.characters = try await persistence.getCharacters()
            if initialLoading { initialLoading.toggle() }
        } catch let error as NetworkError {
            errorMsg = error.description
            showAlert.toggle()
        } catch {
            errorMsg = error.localizedDescription
            showAlert.toggle()
        }
        if initialLoading { initialLoading.toggle() }
    }
    
    func getAdditionalsInfo() async {
        do {
            initialLoading = true
            self.additionalsInfo = try await persistence.getAdditionalsInfo()
            if initialLoading { initialLoading.toggle() }
        } catch let error as NetworkError {
            errorMsg = error.description
            showAlert.toggle()
        } catch {
            errorMsg = error.localizedDescription
            showAlert.toggle()
        }
        if initialLoading { initialLoading.toggle() }
    }
}
    
