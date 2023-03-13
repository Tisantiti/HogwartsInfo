//
//  HouseHogwartsBackground.swift
//  HogwartsInfo
//
//  Created by Santi Pérez on 12/3/23.
//

import Foundation
import SwiftUI

struct HouseBackgroundViewModifier: ViewModifier {
    let house: HogwartsHouses?
    func body(content: Content) -> some View {
        return content
            .background {
                switch house {
                case .gryffindor:
                    Color.red.opacity(0.5)
                        .edgesIgnoringSafeArea(.top)
                case .ravenclaw:
                    Color.blue.opacity(0.5)
                        .edgesIgnoringSafeArea(.top)
                case .slytherin:
                    Color.green.opacity(0.5)
                        .edgesIgnoringSafeArea(.top)
                default:
                    Color.clear
                        .edgesIgnoringSafeArea(.top)
                }
            }
    }
}
