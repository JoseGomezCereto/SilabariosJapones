//
//  GridView.swift
//  SilabariosJapones
//
//  Created by Jose Maria Gomez Cereto on 16/6/24.
//

import SwiftUI

struct GridView: View {
    var silabas: [Silaba]
    let title: String
    @State private var selectedSilaba: Silaba?
    
    var body: some View {
        ZStack {
            ScrollView {
                LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 5), spacing: 4) {
                    ForEach(silabas.indices, id: \.self) { index in
                        GridItemView(silaba: silabas[index]) { selected in
                            selectedSilaba = selected
                        }
                        .aspectRatio(1, contentMode: .fit)
                    }
                }
                .padding(4)
            }
            .navigationTitle(title)
            
            if let silaba = selectedSilaba {
                PopupView(silaba: silaba, isShowing: $selectedSilaba)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.4))
                    .edgesIgnoringSafeArea(.all)
            }
        }
    }
}
