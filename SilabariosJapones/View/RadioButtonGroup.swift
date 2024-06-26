//
//  RadioButtonGroup.swift
//  SilabariosJapones
//
//  Created by Jose Maria Gomez Cereto on 16/6/24.
//

import SwiftUI

struct RadioButtonGroup: View {
    var labels: [String]
    @Binding var selectedOption: Int?

    var body: some View {
        HStack(spacing: 20) {
            ForEach(labels.indices, id: \.self) { index in
                RadioButton(label: labels[index], isSelected: bindingForIndex(index))
            }
        }
    }

    private func bindingForIndex(_ index: Int) -> Binding<Bool> {
        Binding<Bool>(
            get: { selectedOption == index },
            set: { isSelected in
                if isSelected {
                    selectedOption = index
                } else {
                    selectedOption = nil
                }
            }
        )
    }
}
