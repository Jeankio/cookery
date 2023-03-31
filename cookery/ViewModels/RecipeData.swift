import Foundation

// Cree este View Model para conectar el Model y el view
// empecé con una clase RecipeDate la cual es un ObjetoObservable (Obviamente) PARA SUPERVISAR A PUBLISHED
// dentro una published var recipes que ACCEDE a backrecipes que son las recetas quemadas.

class RecipeData: ObservableObject {
    @Published var recipes = Recipe.backRecipes
    
    func recipes(for category: RecipeBasicInfo.Category) -> [Recipe] {
      var filteredRecipes = [Recipe]()
        for recipe in recipes {
        if recipe.recipeBasicInfo.category == category {
          filteredRecipes.append(recipe)
        }
      }
        return filteredRecipes
    }
}
