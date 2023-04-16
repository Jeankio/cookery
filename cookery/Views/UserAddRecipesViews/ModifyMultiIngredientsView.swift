//
//  ModifyMultiIngredientsView.swift
//  cookery
//
//  Created by Jean Karel on 15/04/23.
//

import SwiftUI


struct ModifyMultiIngredientsView: View {
    @Binding var ingredientes: [Ingrediente]

    var body: some View {
        VStack{
            // Adicionar ingrediente en el array de [Ingrediente]
            let addIngredientView = ModifyIngredientsInfoView() { ingrediente in
                ingredientes.append(ingrediente)
            }.navigationTitle("Agregar Ingrediente")
            
            if ingredientes.isEmpty {
                Spacer()
            } else {
                List {
                    ForEach(ingredientes.indices, id: \.self) { index in
                        Text(ingredientes[index].descripcion)
                    }
                }
            }
            NavigationLink(
                ingredientes.isEmpty ? "Agrega ingredientes a tu receta" : "Agrega otro ingrediente",
                destination: addIngredientView
            )
            .buttonStyle(PlainButtonStyle())
            .foregroundColor(.blue)
            
            Spacer()
        }
    }
}



struct ModifyMultiIngredientsView_Previews: PreviewProvider {
    @State static var emptyIngredients = [Ingrediente]()
    static var previews: some View {
        NavigationView {
            ModifyMultiIngredientsView(ingredientes: $emptyIngredients)
        }
    }
}
