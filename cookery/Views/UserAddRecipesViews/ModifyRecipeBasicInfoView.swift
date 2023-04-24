//
//  ModifyRecipeBasicInfo.swift
//  cookery
//
//  Created by Jean Karel on 12/04/23.
// ESTA VISTA DEBE MOSTRARSE SIEMPRE QUE SE SELECCIONE RECETA EN EL PICKER SUPERIOR

import SwiftUI

struct ModifyRecipeBasicInfoView: View {
    @AppStorage ("listBackgroundColor") private var listBackgroundColor = Colores.fondo
    @AppStorage ("listTextColor") private var listTextColor = Colores.primario
    
    @Binding var recipeBasicInfo: RecipeBasicInfo
    
    var body: some View {
        Form {
            TextField("Nombre de la receta", text: $recipeBasicInfo.titulo)
                .listRowBackground(listBackgroundColor)
            TextField("Cooker", text: $recipeBasicInfo.cooker)
                .listRowBackground(listBackgroundColor)
            Section(header: Text("Descripción")) {
                TextEditor(text: $recipeBasicInfo.descripcion)
                    .listRowBackground(listBackgroundColor)
            }
            Picker(selection: $recipeBasicInfo.category, label:
                    HStack {
                Text("Categoría:")
                Spacer()
                //Text(recipeBasicInfo.category.rawValue)
            }) {
                ForEach(RecipeBasicInfo.Category.allCases,
                        id: \.self) { category in
                    Text(category.rawValue)
                }
            }
            //.foregroundColor(.black)
            .pickerStyle(DefaultPickerStyle())
            
            Picker(selection: $recipeBasicInfo.foodtype, label:
                    HStack {
                Text("Tipo de Dieta:")
                Spacer()
                //Text(recipeBasicInfo.foodtype.rawValue)
            }) {
                ForEach(RecipeBasicInfo.FoodType.allCases,
                        id: \.self) { foodtype in
                    Text(foodtype.rawValue)
                }
            }
            //.listRowBackground(listBackgroundColor)
            .pickerStyle(DefaultPickerStyle())
        }
        .foregroundColor(listTextColor)
    }
}
    
    
    

//struct ModifyRecipeBasicInfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        ModifyRecipeBasicInfoView
//    }
//}
