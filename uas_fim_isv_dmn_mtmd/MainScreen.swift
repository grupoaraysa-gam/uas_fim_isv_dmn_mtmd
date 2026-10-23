//
//  MainScreen.swift
//  uas_fim_isv_dmn_mtmd
//
//  Created by Grupo Araysa on 22/10/26.
//

import SwiftUI

struct MainScreen: View {
    // Estado para controlar la visibilidad del menú desplegable (Overflow Menu)
    @State private var menuExpandido = false
    
    // Estado para manejar alertas o mensajes emergentes (equivalente al Toast)
    @State private var mensajeAlerta: String? = nil
    @State private var mostrarAlerta = false

    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                // Contenido principal de la pantalla
                VStack(spacing: 16) {
                    Text("Bienvenido a Material Design")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(.black)
                    
                    Text("Explora las opciones de la barra superior.")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(red: 0.98, green: 0.95, blue: 1.0)) // Tono similar al primario claro de la práctica
                
                // RETO: Botón Flotante (FloatingActionButton / FAB) en la esquina inferior derecha
                Button(action: {
                    dispararMensaje("Elemento agregado")
                }) {
                    Image(systemName: "plus")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(.white)
                        .padding(18)
                        .background(Color.purple)
                        .clipShape(Circle())
                        .shadow(radius: 4)
                }
                .padding(24)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // Título personalizado en la barra superior en color negro
                ToolbarItem(placement: .principal) {
                    Text("Mi Aplicación")
                        .font(.headline)
                        .foregroundColor(.black)
                }
                
                // 1. Icono de Navegación (Izquierda)
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dispararMensaje("Clic en Navegación")
                    }) {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    }
                }
                
                // 2. Iconos de Acción (Derecha)
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    // Botón de Favorito directo
                    Button(action: {
                        dispararMensaje("Añadido a Favoritos")
                    }) {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.red)
                    }
                    
                    // Menú Desplegable (Overflow Menu / 3 puntos)
                    Menu {
                        Button(action: {
                            dispararMensaje("Configuración seleccionada")
                        }) {
                            Label("Configuración", systemImage: "gear")
                        }
                        
                        Button(action: {
                            dispararMensaje("Acerca de seleccionada")
                        }) {
                            Label("Acerca de", systemImage: "info.circle")
                        }
                    } label: {
                        Image(systemName: "ellipsis.vertical")
                            .foregroundColor(.black)
                    }
                }
            }
            .alert(isPresented: $mostrarAlerta) {
                Alert(
                    title: Text("Aviso"),
                    message: Text(mensajeAlerta ?? ""),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }

    // Función auxiliar para activar la alerta simulando el Toast de Android
    private func dispararMensaje(_ texto: String) {
        mensajeAlerta = texto
        mostrarAlerta = true
    }
}

#Preview {
    MainScreen()
}
