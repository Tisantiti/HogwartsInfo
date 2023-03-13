//
//  ErrorView.swift
//  HogwartsInfo
//
//  Created by Santi Pérez on 12/3/23.
//

import SwiftUI

struct ErrorView: View {
    let errorMessage: String
    var body: some View {
        VStack(alignment: .center) {
            Text(errorMessage)
        }
        .padding(10)
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(errorMessage: "Error de carga")
    }
}
