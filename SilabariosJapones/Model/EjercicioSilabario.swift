//
//  EjercicioSilabario.swift
//  SilabariosJapones
//
//  Created by Jose Maria Gomez Cereto on 16/6/24.
//

import Foundation
import Foundation

class EjercicioSilabario {
    // Enum que define los tipos de silabarios disponibles
    enum Silabario {
        case hiragana
        case katakana
    }
    
    // Propiedades de la clase Ejercicio
    let silabario: Silabario            // Tipo de silabario del ejercicio (hiragana o katakana)
    let pregunta: String                // Pregunta del ejercicio
    let opcionA: String                 // Opción A de respuesta
    let opcionB: String                 // Opción B de respuesta
    let opcionC: String                 // Opción C de respuesta
    let opcionD: String                 // Opción D de respuesta
    let respuestaCorrecta: String       // Respuesta correcta entre las opciones A, B, C o D
    
    var seleccionada: String?           // Opción seleccionada por el usuario
    var contestadaCorrectamente: Bool?  // Indicador de si la respuesta seleccionada es correcta
    
    // Inicializador de la clase Ejercicio
    init(silabario: Silabario, pregunta: String, opcionA: String, opcionB: String, opcionC: String, opcionD: String, respuestaCorrecta: String) {
        self.silabario = silabario
        self.pregunta = pregunta
        self.opcionA = opcionA
        self.opcionB = opcionB
        self.opcionC = opcionC
        self.opcionD = opcionD
        self.respuestaCorrecta = respuestaCorrecta
    }
    
    // Método para reiniciar el estado del ejercicio
    func reset() {
        seleccionada = nil
        contestadaCorrectamente = nil
    }
    
    // Método para seleccionar una opción de respuesta
    func seleccionarRespuesta(opcion: String) {
        seleccionada = opcion
    }
    
    // Método para comprobar si la opción seleccionada es la correcta
    func comprobarRespuesta() -> Bool {
        guard let seleccionada = seleccionada else {
            return false
        }
        contestadaCorrectamente = seleccionada == respuestaCorrecta
        return contestadaCorrectamente!
    }
}
