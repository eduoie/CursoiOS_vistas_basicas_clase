//
//  VistaListas.swift
//  CursoiOS vistas basicas
//
//  Created by Equipo 2 on 23/1/26.
//

import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    let nombre: String
}

struct VistaListas: View {
    
    let arrayAnimales = [
        "Gato", "Pájaro", "Pez", "Perro", "Araña", "Hámster", "Pato",
    ]
    
    var listaAnimales: [Animal] = []
    
    init() {
        for animal in arrayAnimales {
            listaAnimales.append(Animal(nombre: animal))
        }
    }
    
    var body: some View {
//        List {
//            Text("Hola")
//            Text("Adios")
//        }
        
//        List {
//            // id:\.self sirve para que swift pueda distinguir un elemento de otro en caso de actualizar la lista.
//            // Al pasar un array de String, usa el texto como identificador único
//            // Esto nos dará problemas si hay nombres repetidos
//            ForEach(arrayAnimales, id:\.self) { animal in
//                Text(animal)
//            }
//        }
        
        List {
            ForEach(listaAnimales) { animal in
                HStack {
                    Spacer()
                    Text(animal.nombre)
                    Spacer()
                }
            }
        }
        
        // Colorear cada elemento de un color, en este caso los pares de gris
        List {
            ForEach(Array(listaAnimales.enumerated()), id: \.element.id) {
                indice, animal in
                Text(animal.nombre)
                .listRowBackground(
                        indice % 2 == 0 ? Color.gray.opacity(0.1) : Color.white
                )
            }
        }
    }
}

#Preview {
    VistaListas()
}
