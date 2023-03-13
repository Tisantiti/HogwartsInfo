//
//  BooksListView.swift
//  HogwartsInfo
//
//  Created by Santi Pérez on 8/3/23.
//

import SwiftUI

struct BooksListView: View {
    @EnvironmentObject var hogwartsInfoVM: HogwartsInfoVM
    
    var body: some View {
                NavigationStack {
        List {
            ForEach(hogwartsInfoVM.books) { book in
                BookCellView(book: book)
            }
        }
        .scrollIndicators(.hidden)
        .listStyle(.plain)
        .refreshable {
            await hogwartsInfoVM.getBooks()
        }
        .navigationTitle("Books")
                }
        .overlay {
            if hogwartsInfoVM.initialLoading {
                LoadingView()
                    .transition(.opacity)
            }
        }
    }
}

struct BooksListView_Previews: PreviewProvider {
    static var previews: some View {
        BooksListView()
    }
}
