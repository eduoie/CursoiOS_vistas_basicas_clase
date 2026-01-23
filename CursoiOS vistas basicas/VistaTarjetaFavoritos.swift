//
//  VistaTarjetaFavoritos.swift
//  CursoiOS vistas basicas
//
//  Created by Equipo 2 on 22/1/26.
//

import SwiftUI

struct VistaTarjetaFavoritos: View {
    var body: some View {
        VStack(spacing: 10) {
            TarjetaFavorito(imagen: "pajarito")
            TarjetaFavorito(imagen: "gatito")
        }
        .padding(.horizontal)
    }
}

struct TarjetaFavorito: View {
    var imagen: String
    
    @State private var esFavorito = false
    
    var body: some View {
        HStack(spacing: 15) {
            Image(imagen)
                .resizable()
                .scaledToFit()
                .frame(width: 100)
            
            // Textos
            VStack(alignment: .leading, spacing: 5) {
                Text("Un miau miau")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.brown)
                
                HStack(spacing: 4) {
                    Image(systemName: "star.fill")
                        .foregroundStyle(.orange)
                        .font(.caption)
                    
                    Text("4.9")
                        .font(.subheadline)
                        .fontWeight(.bold)
                }
                
                Text("Creado por cutie cute®")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            Image(systemName: esFavorito ? "heart.fill" : "heart")
                .foregroundStyle(.red)
                .font(.title3)
                .onTapGesture {
                    esFavorito.toggle()
                }
            
        }
        .padding(15)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}


#Preview {
    VistaTarjetaFavoritos()
}
