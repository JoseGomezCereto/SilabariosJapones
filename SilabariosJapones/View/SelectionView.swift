//
//  MainView.swift
//  SilabariosJapones
//
//  Created by Jose Maria Gomez Cereto on 16/6/24.
//

import SwiftUI

struct SelectionView: View {
    @ObservedObject var viewModel: SilabarioViewModel
    
    var body: some View {
        VStack {
            Text("Silabarios en japonés:")
                .font(.title)
                .padding()
            
            HStack {
                NavigationLink(destination: GridView(silabas: viewModel.silabas(for: .hiragana), title:"Hiragana")) {
                    Text("Hiragana")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding([.leading, .bottom])
                
                NavigationLink(destination: GridView(silabas: viewModel.silabas(for: .katakana), title:"Katakana")) {
                    Text("Katakana")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding([.trailing, .bottom])
            }
            
            NavigationLink(destination: ExerciseView(viewModel: viewModel)) {
                Text("¡Practiquemos!")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Inicio")
    }
}
