//
//  ContentView.swift
//  SilabariosJapones
//
//  Created by Jose Maria Gomez Cereto on 16/6/24.
//

import SwiftUI

//ContentView también actuará como SplashScreen
struct ContentView: View {
    @StateObject var viewModel = SilabarioViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                Text("SILABARIOS EN JAPONÉS")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                Spacer()
                NavigationLink(destination: SelectionView(viewModel: viewModel)) {
                    Text("Empezar")
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding()
        }
    }
}
