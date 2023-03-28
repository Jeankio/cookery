// Este era el archivo contentView por defecto.
// Le cambié el nombre al actual y dentro del código con clic derecho en el struct contentView refactoricé y rename a RecipesLisView
// Eliminé todo el cuerpo del struct y agregué un List {} y .navigationTitle


import SwiftUI

struct RecipesListView: View {
    //Agregaré un @State para que la vista actualice cuando Model cambie. Trayendo a RecipeData (ViewModel)
    @StateObject var recipeData = RecipeData()
    
    var body: some View {
        List {
            //Salía una error Recipe no identifiable. Voy a Recipe en Model.
            ForEach(recipeData.recipes) { recipe in
                Text(recipe.recipeBasicInfo.titulo)
            }
        }
        .navigationTitle("Recetas")
    }
}

extension RecipesListView  {
    var recipes: [Recipe] {
        recipeData.recipes
    }
}

struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RecipesListView()
        }
    }
}
