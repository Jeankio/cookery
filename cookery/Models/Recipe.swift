import Foundation

//1. Modelo de una receta - Struct
// Después del view model y recipeslistview -> Recipe: Identifiable e Identifiable requiere var id = UUID()
struct Recipe: Identifiable {
    var id = UUID()
    
    var recipeBasicInfo: RecipeBasicInfo
    var ingredientes: [Ingrediente]
    var preparaciones: [Preparacion]
    
    //6. Inicializador para crear recetas
    init(recipeBasicInfo: RecipeBasicInfo, ingredientes: [Ingrediente], preparaciones: [Preparacion]){
        self.recipeBasicInfo = recipeBasicInfo
        self.ingredientes = ingredientes
        self.preparaciones = preparaciones
    }// own init
    
    //7. Inicializador para que el Usuario pueda crear (Editar) recetas
    init() {
        self.init(recipeBasicInfo: RecipeBasicInfo(
            titulo: "",
            descripcion: "",
            cooker: "",
            category: .almuerzo,
            foodtype: .sinRestricciones),
                  ingredientes: [],
                  preparaciones: [])
    }// user init
    
} // Struct Recipe

// 2. Puedo reacomodar las cosas:

struct RecipeBasicInfo {
    var titulo: String
    var descripcion: String
    var cooker: String
    var category: Category //Desayuno, almuerzo, cena, postre, snack.
    var foodtype: FoodType //Vegano, fitness, saludable, low carb, sin restricciones, otros.
    
    // Como har'e Enums de category y FoodType ya que tiene varias opciones.
    // son CaseIterable para poder mostras todas las opciones.
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

struct Ingrediente {
    var nombre: String
    var cantidad: Double
    var medida: Medida //Unit
    
//4. Construire una propiedad variable calculada para llamar de forma optimizada a los ingredientes.
    
    var descripcion: String {
        let formatearCantidad = String(format: "%g", cantidad)
        switch medida {
        case .not:
            let formatearNombre = cantidad == 1 ? nombre : "\(nombre)s"
            return "\(formatearCantidad) \(formatearNombre)"
        default:
            if cantidad == 1 {
                return "1 \(medida.singularName) \(nombre)"
            } else {
                return "\(formatearCantidad) \(medida.rawValue) \(nombre)"
            }
        }
    }

    // hare un enum de medida para discriminar las opciones
    enum Medida: String, CaseIterable {
        case l = "Litros"
        case ml = "Mililitros"
        case g = "Gramos"
        case lb = "Libras"
        case kg = "Kilogramos"
        case tbs = "Cucharadas"
        case tsp = "Cucharaditas"
        case cups = "Tazas"
        case not = "Sin medidas"
        
        var singularName: String { String(rawValue.dropLast()) }
    } // enum medida
    
} // struct ingr

struct Preparacion {
    var paso: String
    var opcional: Bool
}// struct prep

//5. BackRecipe file extension de Recipe: backRecipe




