//
//  GridItemView.swift
//  SilabariosJapones
//
//  Created by Jose Maria Gomez Cereto on 16/6/24.
//

import SwiftUI

struct GridItemView: View {
    var silaba: Silaba
    var onSelect: (Silaba?) -> Void

    var body: some View {
        VStack {
            Text(silaba.character)
                .font(.title)
            Text(silaba.reading)
                .font(.subheadline)
        }
        .padding()
        .background(Color.blue)
        .cornerRadius(8)
        .foregroundColor(.white)
        .onTapGesture {
            onSelect(silaba)
        }
    }
}
