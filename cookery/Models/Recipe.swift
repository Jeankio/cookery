import Foundation

//1. Modelo de una receta - Struct
// Después del view model y recipeslistview -> Recipe: Identifiable e Identifiable requiere var id = UUID()

// Persistencia file manager: Codable for all
struct Recipe: Identifiable, Codable {
    var id = UUID()
    
    var recipeBasicInfo: RecipeBasicInfo
    var ingredientes: [Ingrediente]
    var preparaciones: [Preparacion]
    //hacer recetas favoritas #1
    var isFavorite = false
    
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
            foodtype: .fitness),
                  ingredientes: [],
                  preparaciones: [])
    }// user init
    
    //Impedir que el usuario cree recetas vacias
    var isValid: Bool {
        recipeBasicInfo.isValid && !ingredientes.isEmpty && !preparaciones.isEmpty
    }
    //Funcion para obtener los indices correctos cuando el paso es Opcional real
    func index(of direction: Preparacion, excludingOptionalDirections: Bool) -> Int? {
        let preparaciones = preparaciones.filter { excludingOptionalDirections ? !$0.opcional : true }
        let index = preparaciones.firstIndex { $0.description == direction.description }
        return index
      }
} // Struct Recipe

// 2. Puedo reacomodar las cosas:

struct RecipeBasicInfo: Codable {
    var titulo: String
    var descripcion: String
    var cooker: String
    var category: Category //Desayuno, almuerzo, cena, postre, snack.
    var foodtype: FoodType //Vegano, fitness, saludable, low carb, sin restricciones, otros.
    
    // Como har'e Enums de category y FoodType ya que tiene varias opciones.
    // son CaseIterable para poder mostras todas las opciones.
    enum Category: String, CaseIterable, Codable {
        case desayuno = "Desayuno"
        case almuerzo = "Almuerzo"
        case cena = "Cena"
        case postre = "Postre"
        case snack = "Snack"
    } // enum category
    
    enum FoodType: String, CaseIterable, Codable {
        case sinRestricciones = "Normal"
        case vegano = "Vegano"
        case fitness = "Fitness"
        case saludable = "Saludable"
        case lowCarb = "Low carb"
        case otros = "Otros"
    } // enum foodtype
    
    //Impedir que el usuario cree recetas vacias
    var isValid: Bool {
        !titulo.isEmpty && !descripcion.isEmpty && !cooker.isEmpty
    }
} // struct RecipeBasicInfo

//3. Hare un struc para ingr y prep ya que son [] y necesito guardar mas info.

struct Ingrediente: RecipeComponent, Codable {
    var description: String {nombre}
    
    var nombre: String
    var cantidad: Double
    var medida: Medida //Unit
    
    static func singularName() -> String {
        return "Ingrediente"
    }
    
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
    enum Medida: String, CaseIterable, Codable {
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
    
    init(nombre: String, cantidad: Double, medida: Medida) {
        self.nombre = nombre
        self.cantidad = cantidad
        self.medida = medida
    }
    
    init() {
        self.init(nombre: "", cantidad: 0.0, medida: .not)
    }
    
} // struct ingr

struct Preparacion: RecipeComponent {
    var description: String {paso}
    
    var paso: String
    var opcional: Bool
    //Para cumplir con RecipeComponen Preparacion tiene 2 inits igual que ingredient
    init(paso: String, opcional: Bool) {
        self.paso = paso
        self.opcional = opcional
    }
    
    init() {
        self.init(paso: "", opcional: false)
    }
    
    static func singularName() -> String {
        return "Preparación"
    }
    
    static func pluralName() -> String {
        return "Preparaciones"
    }
}// struct prep

//5. BackRecipe file extension de Recipe: backRecipe




