//
// CONTRUCCI'ON DE LA VISTA DE RECETAS:
// Este era el archivo contentView por defecto.
// Le cambié el nombre al actual y dentro del código con clic derecho en el struct contentView refactoricé y rename a RecipesLisView
// Eliminé todo el cuerpo del struct y agregué un List {} y .navigationTitle


import SwiftUI

struct RecipesListView: View {
    //Agregaré un @State para que la vista actualice cuando Model cambie. Trayendo a RecipeData (ViewModel) -> cambi'o a Enviroment
    @EnvironmentObject private var recipeData: RecipeData
    let category: RecipeBasicInfo.Category
    // for modal
    @State private var isPresenting = false
    @State private var newRecipe = Recipe()
    
    private let colorDeFondo = Colores.fondo
    private let colorPrimario  = Colores.primario
    
    var body: some View {
        // Presentar modal -> toolbar
        List {
            //Salía una error Recipe no identifiable. Voy a Recipe en Model.
            // Conectamos RLView con RDView -> Change text por navlink, agregu'e como destino RDView
            ForEach(recipes) { recipe in
                NavigationLink(recipe.recipeBasicInfo.titulo,
                               destination: RecipeDetailsView(recipe: binding(for: recipe)))
            }
            .listRowBackground(colorDeFondo)
            .foregroundColor(colorPrimario)
        }
        .navigationTitle(navigationTitle)
        .toolbar(content: {
            ToolbarItem (placement: .navigationBarTrailing) {
                Button(action: {
                    isPresenting = true
                }, label: {
                    Image(systemName: "plus")
                })
            }
        })
        // Encapsular
        // Sheet for new recipe
        .sheet(isPresented: $isPresenting, content: {
            NavigationView {
                ModifyRecipeView(recipe: $newRecipe, isPresenting: $isPresenting)
                    .navigationTitle("Agrega una Receta")
            }
        })
    }
}

// Cree algunas propiedades para mejorar el code.
extension RecipesListView {
  private var recipes: [Recipe] {
      recipeData.recipes(for: category)
  }
 
  private var navigationTitle: String {
    "Recetas de \(category.rawValue)"
  }
    // Método para devolver un enalce binding
    func binding(for recipe: Recipe) -> Binding<Recipe> {
        guard let index = recipeData.index(of: recipe) else {
            fatalError("Recete no encontrada")
        }
        return $recipeData.recipes[index]
    }
}

struct RecipesListView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
        RecipesListView(category: .desayuno)
    }.environmentObject(RecipeData())
  }
}

// VISTA DE RECETAS COMPLETA -> RECIPEDETAILSVIEW
