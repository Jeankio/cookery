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
        NavigationView {
            List {
                //Salía una error Recipe no identifiable. Voy a Recipe en Model.
                // Conectamos RLView con RDView -> Change text por navlink, agregu'e como destino RDView
                ForEach(recipes) { recipe in
                    NavigationLink(recipe.recipeBasicInfo.titulo,
                                   destination: RecipeDetailsView(recipe: recipe))
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
            // Sheet for new recipe
            .sheet(isPresented: $isPresenting, content: {
                NavigationView {
                    ModifyRecipeView(recipe: $newRecipe)
                        .toolbar(content: {
                            ToolbarItem(placement: .confirmationAction) {
                                // comprobacion de receta completa (Hecho en recipe)
                                if newRecipe.isValid {
                                    Button("Agregar") {
                                        recipeData.recipes.append(newRecipe)
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
            })
        }
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
}

struct RecipesListView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
        RecipesListView(category: .desayuno)
    }.environmentObject(RecipeData())
  }
}

// VISTA DE RECETAS COMPLETA -> RECIPEDETAILSVIEW
