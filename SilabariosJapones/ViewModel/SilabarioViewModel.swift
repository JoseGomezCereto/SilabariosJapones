//
//  SilabarioViewModel.swift
//  SilabariosJapones
//
//  Created by Jose Maria Gomez Cereto on 16/6/24.
//

import Foundation

enum Silabario: String, Decodable {
    case hiragana = "Hiragana"
    case katakana = "Katakana"
    case ambos
}

class SilabarioViewModel: ObservableObject {
    @Published var hiraganaSilabas: [Silaba] = []
    @Published var katakanaSilabas: [Silaba] = []
    @Published var bothSilabas: [Silaba] = []
    
    init() {
        loadSilabas()
    }
    
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
            bothSilabas = hiraganaSilabas + katakanaSilabas
            
        } catch {
            print("Error al cargar datos desde JSON: \(error)")
        }
    }
    
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
}
