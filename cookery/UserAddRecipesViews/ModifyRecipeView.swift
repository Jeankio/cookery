//
//  ModifyRecipeView.swift
//  cookery
//
//  Created by Jean Karel on 4/04/23.
//

import SwiftUI

struct ModifyRecipeView: View {
    @Binding var recipe: Recipe
    
    var body: some View {
        Button("Test recipes.") {
            recipe.recipeBasicInfo = RecipeBasicInfo(titulo: "Prueba Titulo",
                                                     descripcion: "Prueba Descrip.",
                                                     cooker: "Sochaina",
                                                     category: .almuerzo,
                                                     foodtype: .lowCarb)
            recipe.ingredientes = [Ingrediente(nombre: "Prueba Ing.",
                                               cantidad: 2.0,
                                               medida: .not)]
            recipe.preparaciones = [Preparacion(paso: "Paso tal",
                                                opcional: false)]
        }
    }
}

struct ModifyRecipeView_Previews: PreviewProvider {
    @State static var recipe = Recipe()
    static var previews: some View {
        ModifyRecipeView(recipe: $recipe)
    }
}
