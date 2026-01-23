//
//  VistaAlertasMenus.swift
//  CursoiOS vistas basicas
//
//  Created by Equipo 2 on 22/1/26.
//

import SwiftUI

struct VistaAlertasMenus: View {
    @State private var mostrarAlerta = false
    @State private var mostrarActionSheet = false
    @State private var mostrarAlertaTextField = false
    @State private var nombre = ""
    @State private var colorRectangulo = Color.black.opacity(0.5)
    
    var body: some View {
        VStack(spacing: 10) {
            Button("Mostrar aviso") {
                mostrarAlerta.toggle()
            }
            .alert(isPresented: $mostrarAlerta) {
                Alert(
                    title: Text("Aviso"),
                    message: Text("Esto es un aviso"),
                    dismissButton: .default(Text("Aceptar"))
                )
            }

            Button("Mostrar Action Sheet") {
                mostrarActionSheet.toggle()
            }
            .actionSheet(isPresented: $mostrarActionSheet) {
                ActionSheet(
                    title: Text("Escoge como proceder"),
                    message: Text("Puedes aceptar o cancelar"),
                    buttons: [
                        .default(Text("Aceptar cambios")) { aceptar() },
                        .destructive(Text("Rechazar cambios")) { rechazar() },
                        .cancel(Text("Cancelar")) { }   // El botón cancel no es visible en iOS 26
                    ]
                )
            }
            
            // Alerta con un textfield para introducir datos
            Button("Toca para introducir tu nombre") {
                mostrarAlertaTextField.toggle()
            }
            .alert("Datos", isPresented: $mostrarAlertaTextField) {
                TextField("Nombre", text: $nombre)
                Button("Aceptar") {
                    print("Introdujo su nombre: \(nombre)")
                    // Lo dejo vacío por si el usuario quiere volver a introducir el nombre de nuevo
                    nombre = ""
                }
            } message: {
                Text("Introduce tu nombre para confirmar")
            }
            
            // Menú contextual (para colorear el rectángulo de abajo
            Label(
                "Haz long press (mantener apretado) para menú contextual",
                systemImage: "button.horizontal.top.press"
            )
            .foregroundStyle(Color.accentColor)
            .contextMenu {
                Button {
                    colorRectangulo = .red
                } label: {
                    Label("Colorea de rojo", systemImage: "paintbrush")
                }
                Button {
                    colorRectangulo = .green
                } label: {
                    Label("Colorea de verde", systemImage: "leaf")
                }
            }
            Rectangle()
                .fill(colorRectangulo)
                .frame(width: 50, height: 50)
    
            
            Menu("Toca para ver opciones") {
                Button("Editar", systemImage: "pencil") {
                    // Código para editar
                }
                Button("Duplicar", systemImage: "plus.square.on.square") {
                    // Código para duplicar
                }
                Divider() // podemos poner separadores para visualizar y separar los botones
                Button("Eliminar", systemImage: "trash", role: .destructive) {
                    // Código para eliminar
                }
            }
            .menuOrder(.fixed)
            
        }
    }
    
    func aceptar() {
        print("Aceptado")
    }
    
    func rechazar() {
        print("Rechazados cambios")
    }
}

#Preview {
    VistaAlertasMenus()
}
