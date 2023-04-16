//
//  ModifyIngredientsInfoView.swift
//  cookery
//
//  Created by Jean Karel on 14/04/23.
//

import SwiftUI

struct ModifyIngredientsInfoView: View {
    @State var ingrediente = Ingrediente()
    // createAction para que haya forma de guardar los ingredientes
    let createAction: ((Ingrediente) -> Void)
    // Para dismissear el agregador de ingredientes
    @Environment(\.presentationMode) private var mode
    
    private let listBackgroundColor = Colores.fondo
    private let listTextColor = Colores.primario
    
    var body: some View {
        VStack {
            Form {
                TextField("Ingrediente", text: $ingrediente.nombre)
                    .listRowBackground(listBackgroundColor)
                Stepper(value: $ingrediente.cantidad, in: 0...1000, step: 0.5) {
                    HStack {
                        Text("Cantidad:")
                        TextField("Cantidad",
                                  value: $ingrediente.cantidad,
                                  formatter: NumberFormatter.decimal)
                        .keyboardType(.numbersAndPunctuation)
                    }
                }.listRowBackground(listBackgroundColor)
                Picker(selection: $ingrediente.medida, label:
                        HStack {
                    Text("Medida:")
                    Spacer()
                    //Text(ingredientes.medida.rawValue)
                }) {
                    ForEach(Ingrediente.Medida.allCases, id: \.self) { medida in
                        Text(medida.rawValue)
                    }
                }.listRowBackground(listBackgroundColor)
                .pickerStyle(DefaultPickerStyle())
                // Boton para guardar, tiene que ver con createAction
                HStack {
                    Spacer()
                    Button("Guardar", action: {
                        createAction(ingrediente)
                        ingrediente = .init(nombre: "", cantidad: 0.0, medida: .not)
                        // al guardar de oculta la sheet
                        mode.wrappedValue.dismiss()
                    })
                    Spacer()
                }.listRowBackground(listBackgroundColor)
            }
            .foregroundColor(listTextColor)
        }
    }
}


// hacer que el incremento sea de 0.5
extension NumberFormatter {
    static var decimal: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }
}


struct ModifyIngredientsInfoView_Previews: PreviewProvider {
   
    static var previews: some View {
        ModifyIngredientsInfoView(createAction: { ingrediente in
            
        })
    }
}
