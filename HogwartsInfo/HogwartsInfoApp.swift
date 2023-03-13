//
//  HogwartsInfoApp.swift
//  HogwartsInfo
//
//  Created by Santi Pérez on 6/3/23.
//

import SwiftUI

@main
struct HogwartsInfoApp: App {
    @StateObject var hogwartsInfoVM = HogwartsInfoVM()

    var body: some Scene {
        WindowGroup {
            VStack {
                MainTab()
            }
            .environmentObject(hogwartsInfoVM)
        }
    }
}
