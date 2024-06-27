//
//  SilabarioViewModel.swift
//  SilabariosJapones
//
//  Created by Jose Maria Gomez Cereto on 16/6/24.
//

import Foundation

//Enum para el tipo de silabario
enum Silabario: String, Decodable {
    case hiragana = "Hiragana"
    case katakana = "Katakana"
    case ambos
}

class SilabarioViewModel: ObservableObject {
    @Published var hiraganaSilabas: [Silaba] = []
    @Published var katakanaSilabas: [Silaba] = []
    @Published var bothSilabas: [Silaba] = []
    @Published var ejercicioViewModel = EjercicioSilabarioViewModel()
    
    init() {
        loadSilabas()
        //Generar el primer ejercicio
        generarEjercicio(basadoEn: 0) // 0 representa hiragana
    }
    
    //Método que decodifica el JSON
    private func loadSilabas() {
        guard let path = Bundle.main.path(forResource: "Silabarios", ofType: "json") else {
            return
        }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let decoder = JSONDecoder()
            
            let silabarios = try decoder.decode([String: [Silaba]].self, from: data)
            
            hiraganaSilabas = silabarios[Silabario.hiragana.rawValue] ?? []
            katakanaSilabas = silabarios[Silabario.katakana.rawValue] ?? []
            bothSilabas = (hiraganaSilabas + katakanaSilabas).shuffled()
            
        } catch {
            print("Error al cargar datos desde JSON: \(error)")
        }
    }
    
    //Método que genera ejercicio basado en un silabario concreto seleccionado
    func generarEjercicio(basadoEn selectedSilabario: Int?) {
        let silabario: Silabario = {
            switch selectedSilabario {
            case 0: return .hiragana
            case 1: return .katakana
            default: return .ambos
            }
        }()
        
        let silabas = self.silabas(for: silabario)
        ejercicioViewModel.generarEjercicio(silabas: silabas, silabario: silabario)
    }
    
    //Switch que determina qué lista debemos usar
    func silabas(for silabario: Silabario) -> [Silaba] {
        switch silabario {
        case .hiragana:
            return hiraganaSilabas
        case .katakana:
            return katakanaSilabas
        case .ambos:
            return bothSilabas
        }
    }
    
    //Viewmodel específico de ejercicios
    class EjercicioSilabarioViewModel: ObservableObject {
        @Published var ejercicioActual: Ejercicio?
        func generarEjercicio(silabas: [Silaba], silabario: Silabario = .hiragana) {
            guard silabas.count >= 4 else { return }
            
            let indiceCorrecto = Int.random(in: 0..<silabas.count)
            let silabaCorrecta = silabas[indiceCorrecto]
            var opciones: [String] = []
            
            var indicesSeleccionados: [Int] = [indiceCorrecto]
            
            // Generamos 3 índices únicos diferentes del índice de la sílaba correcta
            while indicesSeleccionados.count < 4 {
                let indiceAleatorio = Int.random(in: 0..<silabas.count)
                if !indicesSeleccionados.contains(indiceAleatorio) {
                    indicesSeleccionados.append(indiceAleatorio)
                    opciones.append(silabas[indiceAleatorio].reading)
                }
            }
               
               // Añadir la opción correcta y mezclar
               opciones.append(silabaCorrecta.reading)
               opciones.shuffle()
               
            
            
            // Crear un nuevo Ejercicio
            ejercicioActual = Ejercicio(silabario: silabario, opciones: opciones, respuestaCorrecta: silabaCorrecta.reading, character: silabaCorrecta.character)
        }
    }
}
