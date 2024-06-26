//
//  ExerciseView.swift
//  SilabariosJapones
//
//  Created by Jose Maria Gomez Cereto on 16/6/24.
//

import SwiftUI

struct ExerciseView: View {
    @ObservedObject var viewModel: SilabarioViewModel
    @State private var selectedSilabario: Int? = 0
    @State private var selectedOption: Int? = 0

    var body: some View {
        VStack(spacing: 20) {
            Text("Selecciona un silabario:")
                .font(.title3)
            
            HStack(spacing: 20) {
                RadioButton(label: "Hiragana", isSelected: bindingForSilabario(0))
                RadioButton(label: "Katakana", isSelected: bindingForSilabario(1))
                RadioButton(label: "Ambos", isSelected: bindingForSilabario(2))
            }
            .padding(.top, 10)

            Text("¿Cuál es este carácter?")
                .font(.title)
                .padding(.top, 20)

            Text("あ")
                .font(.largeTitle)
                .padding(.leading, 20)

            HStack(spacing: 20) {
                RadioButton(label: "a", isSelected: bindingForOption(0))
                RadioButton(label: "su", isSelected: bindingForOption(1))
                RadioButton(label: "i", isSelected: bindingForOption(2))
                RadioButton(label: "ka", isSelected: bindingForOption(3))
            }

        
            HStack {
                Text("Aciertos:")
                Text("10")
                    .foregroundColor(.green)
            }
            .padding(.top, 20)
            
            HStack {
                Text("Fallos:")
                Text("5")
                    .foregroundColor(.red)
            }

            Button("Reset") {
                selectedOption = nil
                selectedSilabario = nil
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            .padding(.top, 20)
        }
        .padding(16)
        .navigationTitle("¡A practicar!")
    }

    private func bindingForSilabario(_ value: Int) -> Binding<Bool> {
        Binding<Bool>(
            get: { selectedSilabario == value },
            set: { isSelected in
                if isSelected {
                    selectedSilabario = value
                } else {
                    selectedSilabario = nil
                }
            }
        )
    }

    private func bindingForOption(_ value: Int) -> Binding<Bool> {
        Binding<Bool>(
            get: { selectedOption == value },
            set: { isSelected in
                if isSelected {
                    selectedOption = value
                } else {
                    selectedOption = nil
                }
            }
        )
    }
}
