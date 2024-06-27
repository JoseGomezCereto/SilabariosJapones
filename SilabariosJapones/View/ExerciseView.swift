//
//  ExerciseView.swift
//  SilabariosJapones
//
//  Created by Jose Maria Gomez Cereto on 16/6/24.
//
import SwiftUI

struct ExerciseView: View {
    @ObservedObject var viewModel: SilabarioViewModel
    @State private var selectedSilabario: Int? = 0 // Hiragana por defecto
    @State private var selectedOption: Int? = nil
    @State private var aciertos: Int = 0
    @State private var fallos: Int = 0

    var body: some View {
        VStack(spacing: 20) {
            VStack(spacing: 10) {
                Text("Selecciona un silabario:")
                    .font(.subheadline)
                
                HStack(spacing: 20) {
                    RadioButton(label: "Hiragana", isSelected: bindingForSilabario(0))
                    RadioButton(label: "Katakana", isSelected: bindingForSilabario(1))
                    RadioButton(label: "Ambos", isSelected: bindingForSilabario(2))
                }
            }
            .padding(.top, 10)
            Spacer()

            // Mostrar el carácter del ejercicio actual
            Text("¿Cuál es este carácter?")
                .font(.title)
                .padding(.top, 20)

            if let ejercicioActual = viewModel.ejercicioViewModel.ejercicioActual{
                Text(ejercicioActual.character)
                    .font(.largeTitle)
                    .padding(.leading, 20)

                // Mostrar opciones de respuesta
                HStack(spacing: 20) {
                    ForEach(0..<ejercicioActual.opciones.count, id: \.self) { index in
                        RadioButton(label: ejercicioActual.opciones[index], isSelected: bindingForOption(index))
                    }
                }
            }

            HStack {
                VStack {
                    Text("Aciertos:")
                    Text("\(aciertos)")
                        .foregroundColor(.green)
                }
                VStack {
                    Text("Fallos:")
                    Text("\(fallos)")
                        .foregroundColor(.red)
                }
            }
            .padding(.top, 20)
            
            Button("Reset") {
                aciertos = 0
                fallos = 0
                viewModel.generarEjercicio(basadoEn: selectedSilabario) // Genera un nuevo ejercicio al resetear
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            .padding(.top, 20)
            
            Spacer()
        }
        .padding(16)
        .navigationTitle("¡A practicar!")
        .onChange(of: selectedSilabario) { _ in
            viewModel.generarEjercicio(basadoEn: selectedSilabario)
        }
        .onChange(of: selectedOption) { nuevaOpcion in
            if let nuevaOpcion = nuevaOpcion, let ejercicioActual = viewModel.ejercicioViewModel.ejercicioActual {
                let respuestaCorrecta = ejercicioActual.respuestaCorrecta == ejercicioActual.opciones[nuevaOpcion]
                if respuestaCorrecta {
                    aciertos += 1
                } else {
                    fallos += 1
                }
                viewModel.generarEjercicio(basadoEn: selectedSilabario)
                selectedOption = nil // Resetea la selección de opción después de comprobar
            }
        }
    }

    private func bindingForSilabario(_ value: Int) -> Binding<Bool> {
        Binding<Bool>(
            get: { selectedSilabario == value },
            set: { isSelected in
                if isSelected {
                    selectedSilabario = value
                    viewModel.generarEjercicio(basadoEn: value)
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
                }
            }
        )
    }
}
