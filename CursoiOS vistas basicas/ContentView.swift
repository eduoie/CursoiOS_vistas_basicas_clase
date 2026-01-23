//
//  ContentView.swift
//  CursoiOS vistas basicas
//
//  Created by Equipo 2 on 19/1/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    NavigationLink(destination: VistaPaddings()) {
                        Text("Ir a vista de paddings")
                    }
                    NavigationLink(destination: VistaTexto()) {
                        Text("Ir a vista de textos")
                    }
                    NavigationLink(destination: VistaStacks()) {
                        Text("Ir a vista de Stacks")
                    }
                    NavigationLink(destination: VistaImagenes()) {
                        Text("Ir a vista de Imágenes")
                    }
                    NavigationLink(destination: VistaBotones()) {
                        Text("Ir a vista de botones")
                    }
                    NavigationLink(destination: VistaTextInputs()) {
                        Text("Ir a vista de inserción de texto")
                    }
                    NavigationLink(destination: VistaTogglesSliders()) {
                        Text("Ir a vista de Toggles, Steppers, Sliders")
                    }
                    NavigationLink(destination: VistaForms()) {
                        Text("Ir a vista de formularios")
                    }
                    NavigationLink(destination: VistaAlertasMenus()) {
                        Text("Ir a vista de alertas y menús")
                    }
                    NavigationLink(destination: VistaTouchGestures()) {
                        Text("Ir a vista de toques")
                    }
                    NavigationLink(destination: VistaTarjetaPerfil()) {
                        Text("Ir a vista tarjeta de perfil")
                    }
                    NavigationLink(destination: VistaTarjetaFavoritos()) {
                        Text("Ir a vista tarjetas de favoritos")
                    }

                }
            }
        }
    }
}

#Preview {
    ContentView()
}
