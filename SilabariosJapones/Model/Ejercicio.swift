//
//  EjercicioSilabario.swift
//  SilabariosJapones
//
//  Created by Jose Maria Gomez Cereto on 16/6/24.
//

import Foundation

class Ejercicio {
    var silabario: Silabario // Enum que indica si es hiragana, katakana o ambos
    var opciones: [String]
    var respuestaCorrecta: String
    var character: String
    var respuestaSeleccionada: String?

    init(silabario: Silabario, opciones: [String], respuestaCorrecta: String, character: String) {
        self.silabario = silabario
        self.opciones = opciones
        self.respuestaCorrecta = respuestaCorrecta
        self.character = character
    }

    func seleccionarRespuesta(opcion: String) {
        respuestaSeleccionada = opcion
    }

    func comprobarRespuesta() -> Bool {
        return respuestaSeleccionada == respuestaCorrecta
    }
}
