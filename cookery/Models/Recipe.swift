import Foundation

//1. Modelo de una receta - Struct
struct Recipe {
    var recipeBasicInfo: RecipeBasicInfo
    var ingredients: [Ingredient]
    var preparation: [Preparation]
} // Struct Recipe

// 2. Puedo reacomodar las cosas:

struct RecipeBasicInfo {
    var name: String
    var description: String
    var cooker: String
    var category: Category //Desayuno, almuerzo, cena, postre, snack.
    var foodtype: FoodType //Vegano, fitness, saludable, low carb, sin restricciones, otros.
    
    // Como hare enums de category y type ya que tiene varias opciones.
    // son case iterable para poder mostras todas las opciones.
    enum Category: String, CaseIterable {
        case desayuno = "Desayuno"
        case almuerzo = "Almuerzo"
        case cena = "Cena"
        case postre = "Postre"
        case snack = "Snack"
    } // enum category
    
    enum FoodType: String, CaseIterable {
        case sinRestricciones = "Sin restricciones"
        case vegano = "Vegano"
        case fitness = "Fitness"
        case saludable = "Saludable"
        case lowCarb = "Low carb"
        case otros = "Otros"
    } // enum foodtype
} // struct RecipeBasicInfo

//3. Hare un struc para ingr y prep ya que son [] y necesito guardar mas info.

struct Ingredient {
    var name: String
    var cantidad: Double
    var medida: Medida //Gramo, libra, kilo, cucharada, taza, cucharadita, al gusto, no aplica.

    // hare un enum de medida para discriminar las opciones
    enum Medida: String, CaseIterable {
        case l = "Litros"
        case ml = "Mililitros"
        case g = "Gramos"
        case lb = "Libras"
        case kg = "Kilogramos"
        case tbs = "Cucharadas"
        case tsp = "Cucharaditas"
        case cup = "Tazas"
        case mcup = "Media taza"
        case ccup = "Cuarto de taza"
    } // enum medida
} // struct ingr

struct Preparation {
    var paso: String
    var opcional: Bool
}// struct prep



