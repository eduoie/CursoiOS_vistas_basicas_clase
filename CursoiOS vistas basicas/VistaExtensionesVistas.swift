//
//  VistaExtensionesVistas.swift
//  CursoiOS vistas basicas
//
//  Created by Equipo 2 on 26/1/26.
//

import SwiftUI

struct VistaExtensionesVistas: View {
    @State private var estaResaltado = false

    var body: some View {

        Text("Hola!")
            .estilo1()
        
        Button("Un botón") {}
            .botonGrande()
        
        Button("Otro botón de color negro") {}
            .modifier(BotonModifier(color: .black))
        
        // Este código hace lo mismo que el de arriba pero usando la extensión
        Button("Botón de color rojo") {}
            .estiloColorBoton(color: .red)
        
        Text("Actívame")
            .toggleColoreable()
        
        Divider()
        
        // Ejemplo para ViewModifiers con estado que se le pasa desde la vista principal
        Text("Texto con bordes resaltables")
            .bordeModificado(activado: $estaResaltado)
        
        Button("Cambiar borde") {
            estaResaltado.toggle()
        }
        .estiloColorBoton(color: .green)
    }
}

// Extendemos la FUNCIONALIDAD de las vistas.
extension View {
    func estilo1() -> some View {
        self
            .foregroundStyle(.indigo)
            .bold()
            .font(.title3)
            .italic()
    }
    
    func botonGrande() -> some View {
        self
            .padding()
            .background(.blue)
            .foregroundStyle(.white)
            .cornerRadius(10)
    }
}

struct BotonModifier: ViewModifier {
    let color: Color
    
    // content es la referencia a la vista
    func body(content: Content) -> some View {
        content // aquí usamos content en vez de self
            .padding(12)
            .background(color)
            .foregroundStyle(.white)
            .cornerRadius(10)
    }
}
extension View {
    func estiloColorBoton(color: Color = .blue) -> some View {
        self.modifier(BotonModifier(color: color))
    }
}

// ViewModifiers con @State

extension View {
    func toggleColoreable() -> some View {
        self.modifier(ToggleColoreable())
    }
}

struct ToggleColoreable: ViewModifier {
    @State var activado: Bool = false
    
    func body(content: Content) -> some View {
        Toggle(isOn: $activado) {
            content
                .foregroundStyle(activado ? .red : .primary)
        }
        .padding()
    }
}

// ViewModifier con un parámetro que recibimos (Binding)
struct ModificadorBordes: ViewModifier {
    // 'activado' va a ser el estado que recibimos desde fuera
    @Binding var activado: Bool
    
    func body(content: Content) -> some View {
        content
            .padding()
            .border(activado ? .red : .gray, width: 2)
            .background(activado ? .red.opacity(0.5) : .white)
    }
}
extension View {
    func bordeModificado(activado: Binding<Bool>) -> some View {
        self.modifier(ModificadorBordes(activado: activado))
    }
}


#Preview {
    VistaExtensionesVistas()
}
