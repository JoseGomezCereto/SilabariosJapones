//
//  RadioButton.swift
//  SilabariosJapones
//
//  Created by Jose Maria Gomez Cereto on 16/6/24.
//

import SwiftUI

struct RadioButton: View {
    var label: String
    @Binding var isSelected: Bool

    var body: some View {
        Button(action: {
            isSelected.toggle()
        }) {
            HStack {
                Image(systemName: isSelected ? "largecircle.fill.circle" : "circle")
                    .foregroundColor(isSelected ? .blue : .gray)
                    .imageScale(.large)
                Text(label)
                    .foregroundColor(.primary)
            }
        }
        .buttonStyle(PlainButtonStyle())
        .padding(.vertical, 8)
    }
}
