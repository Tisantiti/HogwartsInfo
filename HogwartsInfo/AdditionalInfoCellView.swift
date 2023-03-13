//
//  AdditionalInfoCellView.swift
//  HogwartsInfo
//
//  Created by Santi Pérez on 12/3/23.
//

import SwiftUI

struct AdditionalInfoCellView: View {
    let additionalInfo: AdditionalInfo
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("\(additionalInfo.infoType)")
                .font(.body)
                .bold()
                .underline()
            HStack(alignment: .top) {
                Image(systemName: "info.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 10, height: 10)
                Text("\(additionalInfo.content)")
                    .font(.footnote)
            }
        }
    }
}

struct AdditionalInfoCellView_Previews: PreviewProvider {
    static var previews: some View {
        AdditionalInfoCellView(additionalInfo: .init(id: 1, infoType: "Autora", content: "J. K. Rowling"))
    }
}
