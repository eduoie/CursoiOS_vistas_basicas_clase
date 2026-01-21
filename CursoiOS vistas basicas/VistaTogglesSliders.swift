//
//  VistaTogglesSliders.swift
//  CursoiOS vistas basicas
//
//  Created by Equipo 2 on 21/1/26.
//

import SwiftUI

struct VistaTogglesSliders: View {
    @State private var usarWifi = true
    @State private var numArticulos = 0
    @State private var posicionSlider = 2.0 // Slider exige decimales.
    
    var body: some View {
        VStack {
            
            // Toggle: encendido o apagado. Un switch o conmutador.
            Toggle(isOn: $usarWifi) {
                Text("Usar wifi?")
            }
            Text(usarWifi ? "Usar Wifi" : "No usar Wifi")
                
            Stepper(value: $numArticulos, in: 0...10, step: 1) {
                Text("Número de artículos: \(numArticulos)")
            }
            .onChange(of: numArticulos) { oldValue, newValue in
                
            }
            
            // Stepper en el que gestionamos manualmente los incrementos y decrementos
            Stepper {
                Text("Número de artículos: \(numArticulos)")
            } onIncrement: {
                if numArticulos < 10 {
                    numArticulos += 1
                }
            } onDecrement: {
                if numArticulos > 0 {
                    numArticulos -= 1
                }
            }
            
            Slider(value: $posicionSlider, in: 1...5, step: 1) {
                // Etiqueta de accesibilidad
                Text("Slider está en posición \(Int(posicionSlider))")
            }
            Text("Slider está en posición \(Int(posicionSlider))")
            
        }
        .padding(10)
    }
}

#Preview {
    VistaTogglesSliders()
}
