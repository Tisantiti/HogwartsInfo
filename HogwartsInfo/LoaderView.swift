//
//  LoaderView.swift
//  HogwartsInfo
//
//  Created by Santi Pérez on 6/3/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.regularMaterial)
            ProgressView()
                .progressViewStyle(.circular)
        }
        .ignoresSafeArea()
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
