//
//  ModifyRecipeView.swift
//  cookery
//
//  Created by Jean Karel on 4/04/23.
//

import SwiftUI

struct ModifyRecipeView: View {
    @EnvironmentObject private var recipeData: RecipeData
    
    @Binding var recipe: Recipe
    @Binding var isPresenting: Bool
    
    @State private var selection = Selection.basicInfo
    
    var body: some View {
        NavigationView{
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
                    //Para mostrar la visa de:
                    ModifyRecipeBasicInfoView(recipeBasicInfo: $recipe.recipeBasicInfo)
                case .ingredientes:
                    Text("Ingredientes de la Receta")
                case .preparacion:
                    Text("Preparación de la Receta")
                }
                Spacer()
            }
            .toolbar(content: {
                ToolbarItem(placement: .confirmationAction) {
                    // comprobacion de receta completa (Hecho en recipe)
                    if recipe.isValid {
                        Button("Agregar") {
                            recipeData.recipes.append(recipe)
                            isPresenting = false
                        }
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") {
                        isPresenting = false
                    }
                }
            })
            .navigationTitle("Agrega una Receta")
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
        ModifyRecipeView(recipe: $recipe, isPresenting: .constant(true))
    }
}
