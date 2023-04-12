//
//  ModifyRecipeView.swift
//  cookery
//
//  Created by Jean Karel on 4/04/23.
//

import SwiftUI

struct ModifyRecipeView: View {
    @Binding var recipe: Recipe
    
    @State private var selection = Selection.basicInfo
    
    var body: some View {
        VStack{
            Picker("Select recipe component", selection: $selection) {
                Text("Receta").tag(Selection.basicInfo)
                Text("Ingredientes").tag(Selection.ingredientes)
                Text("Preparación").tag(Selection.preparacion)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            switch selection {
            case .basicInfo:
                Text("Info de la Receta")
            case .ingredientes:
                Text("Ingredientes de la Receta")
            case .preparacion:
                Text("Preparación de la Receta")
            }
            Spacer()
        }
    }
    
    
    enum Selection {
        case basicInfo
        case ingredientes
        case preparacion
    }
}











struct ModifyRecipeView_Previews: PreviewProvider {
    @State static var recipe = Recipe()
    static var previews: some View {
        ModifyRecipeView(recipe: $recipe)
    }
}
