//
//  Silaba.swift
//  SilabariosJapones
//
//  Created by Jose Maria Gomez Cereto on 16/6/24.
//

import Foundation
import UIKit

class Silaba: Identifiable, Decodable {
    var id: UUID? = UUID()
    var character: String
    var reading: String
    var gifName: String

    init(character: String, reading: String, gifName: String) {
        self.character = character
        self.reading = reading
        self.gifName = gifName
    }
}
