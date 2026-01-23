//
//  VistaScrollHorizontal.swift
//  CursoiOS vistas basicas
//
//  Created by Equipo 2 on 23/1/26.
//

import SwiftUI

struct VistaScrollHorizontal: View {
    var body: some View {
        //VistaTarjeta(numero: 0)
        VStack(alignment: .leading) {
            Text("Categorías")
                .font(.title2)
                .bold()
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(0..<5) { indice in
                        VistaTarjeta(numero: indice)
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 5)
            }
        }
    }
}

struct VistaTarjeta: View {
    let numero: Int
    let colores: [Color] = [.red, .blue, .yellow, .green, .brown]
    
    var body: some View {
        VStack {
            Text("Nivel \(numero + 1)")
                .font(.headline)
                .foregroundStyle(.white)
            
            Spacer()
            
            Image(systemName: "star.fill")
                .foregroundStyle(.yellow)
        }
        .padding()
        .frame(width: 150, height: 200)
        .background(colores[numero % colores.count])
        .cornerRadius(20)
        .shadow(radius: 5)
    }
}

#Preview {
    VistaScrollHorizontal()
}
