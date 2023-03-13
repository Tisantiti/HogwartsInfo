//
//  AlertErrorViewModifier.swift
//  HogwartsInfo
//
//  Created by Santi Pérez on 12/3/23.
//

import Foundation
import SwiftUI

struct AlertErrorViewModifier: ViewModifier {
    @Binding var showAlert: Bool
    @Binding var errorMsg: String
    
    func body(content: Content) -> some View {
        content
            .alert("Error de carga",
                   isPresented: $showAlert) {
                Button(action: {}, label: { Text("OK") })
            } message: {
                Text(errorMsg)
            }
    }
}
