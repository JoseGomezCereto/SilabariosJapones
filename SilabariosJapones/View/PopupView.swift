//
//  PopupView.swift
//  SilabariosJapones
//
//  Created by Jose Maria Gomez Cereto on 17/6/24.
//

import SwiftUI


struct PopupView: View {
    var silaba: Silaba
    @Binding var isShowing: Silaba?

    var body: some View {
        if isShowing != nil {
            GeometryReader { geometry in
                VStack(spacing: 10) {
                    GifImageView(silaba.gifName)
                        .frame(height: geometry.size.height * 0.15) // Limita la altura del GifImageView
                        .padding(.top, 30)
                        .padding(.horizontal, -20)
                        .padding(.bottom, 20)
                    Button("Cerrar") {
                        isShowing = nil
                    }
                    .padding(.bottom, 20)
                }
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 20)
                .padding(40)
                .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
            }
        }
    }
}
