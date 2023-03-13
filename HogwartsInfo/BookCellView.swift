//
//  BookCellView.swift
//  HogwartsInfo
//
//  Created by Santi Pérez on 8/3/23.
//

import SwiftUI

struct BookCellView: View {
    @EnvironmentObject var hogwartsInfoVM: HogwartsInfoVM
    let book: Book
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("\(book.spanishTitle)")
                .font(.body)
                .bold()
            HStack(spacing: 4) {
                Text("Autor/a:")
                Text(book.author)
            }
            .italic()
            .font(.footnote)
            Text("Sinopsis")
                .font(.caption)
                .underline()
            Text(book.description)
                .font(.caption)
        }
        .padding()
    }
}

struct BookCellView_Previews: PreviewProvider {
    static var previews: some View {
        BookCellView(book: .init(id: 1, spanishTitle: "Título del libro", englishTitle: "Title of book", releaseDate: "26 de junio de 1997", author: "Santiago Pérez", description: "El día de su cumpleaños, Harry Potter descubre que es hijo de dos conocidos hechiceros, de los que ha heredado poderes mágicos. Debe asistir a una famosa escuela de magia y hechicería, donde entabla una amistad con dos jóvenes que se convertirán en sus compañeros de aventura. Durante su primer año en Hogwarts, descubre que un malévolo y poderoso mago llamado Voldemort está en busca de una piedra filosofal que alarga la vida de quien la posee."))
    }
}
