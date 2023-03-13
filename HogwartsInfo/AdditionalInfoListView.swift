//
//  AdditionalInfoList.swift
//  HogwartsInfo
//
//  Created by Santi Pérez on 12/3/23.
//

import SwiftUI

struct AdditionalInfoListView: View {
    @EnvironmentObject var hogwartsInfoVM: HogwartsInfoVM
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(hogwartsInfoVM.additionalsInfo) { additionalInfo in
//                    NavigationLink(value: additionalInfo) {
                        AdditionalInfoCellView(additionalInfo: additionalInfo)
//                    }
                }
            }
            .refreshable {
                await hogwartsInfoVM.getAdditionalsInfo()
            }
            .navigationTitle("Additional Info")
            .scrollIndicators(.hidden)
        }
        .overlay {
            if hogwartsInfoVM.initialLoading {
                LoadingView()
                    .transition(.opacity)
            }
        }
    }
}

struct AdditionalInfoListView_Previews: PreviewProvider {
    static var previews: some View {
        AdditionalInfoListView()
    }
}
