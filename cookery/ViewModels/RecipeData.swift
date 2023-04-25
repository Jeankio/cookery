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
    
    //Marcar recetas favoritas (prop computada) #5
    var favoriteRecipes: [Recipe] {
        recipes.filter { recipe in recipe.isFavorite }
    }
    // Persistence #5
    func add(recipe: Recipe) {
        if recipe.isValid {
            recipes.append(recipe)
            saveRecipes()
        }
    }
    
    // Método para devolver el indice de una recipe y poder editarla
    // Mejorado después:
    func index (of recipe: Recipe) -> Int? {
        return recipes.firstIndex(where: { $0.recipeBasicInfo.titulo == recipe.recipeBasicInfo.titulo })
    }
    
    // M'etodo para codificar recipes, lo escribi luego de definir la computada propiedad # 3
    func saveRecipes() {
        do {
            let encodedData = try JSONEncoder().encode(recipes)
            try encodedData.write(to: recipesFileURL)
        }
        catch {
            fatalError("An error ocurred while saving recipes: \(error)")
        }
    }
    
    // Medodo para decodificar recipes # 4
    
    func loadRecipes() {
        guard let data = try? Data(contentsOf: recipesFileURL) else { return }
        do {
            let savedRecipes = try JSONDecoder().decode([Recipe].self, from: data)
            recipes = savedRecipes
        }
        catch {
            fatalError("An error occured while loading recipes: \(error)")
        }
    }
    
    
    // Propiedad computada para persistencia: #2 for persistence la primera fue hacer codeable todo lo de recipe
    
    private var recipesFileURL: URL {
        do {
            let documentsDirectory = try FileManager.default.url(
                for: .documentDirectory,
                in: .userDomainMask,
                appropriateFor: nil,
                create: true)
            return documentsDirectory.appendingPathComponent("recipeData")
        }
        catch {
            fatalError("An error ocurred while getting the url: \(error)")
        }
    }
}
