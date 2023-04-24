//
//  SettingsView.swift
//  cookery
//
//  CREADA PARA EDITAR LOS COLORES DE LAS LISTAS DE RECIPES
//

import SwiftUI

struct SettingsView: View {
    //Antes:
    //@State private var hideOptionalSteps: Bool = false
    //Ahora:
    @AppStorage("hideOptionalSteps") private var hideOptionalSteps: Bool = false
    //Antes:
    //@State private var listBackgroundColor = Colores.fondo
    //@State private var listTextColor = Colores.primario
    
    //Ahora, por lo que pasó en colores:
    @AppStorage("listBackgroundColor") private var listBackgroundColor = Colores.fondo
    @AppStorage("listTextColor") private var listTextColor = Colores.primario
    
    var body: some View {
        NavigationView {
            Form {
                ColorPicker("Color de la Lista", selection: $listBackgroundColor)
                    .padding()
                    .listRowBackground(listBackgroundColor)
                ColorPicker("Color del texto", selection: $listTextColor)
                    .padding()
                    .listRowBackground(listBackgroundColor)
                Toggle("Ocultar pasos opcionales", isOn: $hideOptionalSteps)
                    .padding()
                    .listRowBackground(listBackgroundColor)
            }
            .foregroundColor(listTextColor)
            .navigationTitle("Ajustes")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
