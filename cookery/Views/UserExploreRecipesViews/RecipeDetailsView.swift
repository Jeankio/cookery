// CREACI'ON DE LA VIEW DONDE SE MUESTRAN LAS RECETAS Y SUS DETALLES
import SwiftUI

struct RecipeDetailsView: View {
    //Hecho settings view, replicarlo aquí
    @AppStorage("hideOptionalSteps") private var hideOptionalSteps: Bool = false
    // Decalar'e un prop cons recipe de tipo Recipe: Cambio:
    // Ahora es un binding creado en recipelistview: (Antes solo let)
    @Binding var recipe: Recipe
    //Prepararon edit boton y su view
    @State private var isPresenting = false
    @EnvironmentObject private var recipeData: RecipeData
    
    private let colorDeFondo = Colores.fondo
    private let colorPrimario  = Colores.primario
    
    var body: some View {
        // Mostrare info del cooker, descripcion de la recipe y el titulo
        VStack {
            HStack {
                Text("Cooker: \(recipe.recipeBasicInfo.cooker)")
                    .font(.subheadline)
                    .padding()
                Spacer()
            }
            HStack {
                Text(recipe.recipeBasicInfo.descripcion)
                    .font(.subheadline)
                    .padding()
                Spacer()
            }
            // Hare una lista para mostrar ingredientes y preparaci'on
            List {
                Section(header: Text("Ingredientes")) {
                    //Viene un ForEach: para iterar las recetas y mostrar
                    ForEach(recipe.ingredientes.indices, id: \.self) { index in
                        let ingrediente = recipe.ingredientes[index]
                        //Hago uso de la propiedad (En Recipe) var calculada para llamar al los ingredientes.
                        Text(ingrediente.descripcion)
                            .foregroundColor(colorPrimario)
                    }
                }
                Section(header: Text("Cómo prepararlo?")) {
                    ForEach(recipe.preparaciones.indices, id: \.self) { index in
                        let preparacion = recipe.preparaciones[index]
                        Text(preparacion.paso)
                        if preparacion.opcional && hideOptionalSteps {
                            EmptyView()
                        } else {
                            HStack {
                                //Traer la función de recipe index
                                let index = recipe.index(of: preparacion, excludingOptionalDirections: hideOptionalSteps) ?? 0
                                Text("\(index + 1). ").bold()
                                Text("\(preparacion.opcional ? "(Opcional)" : "")\(preparacion.description)")
                            }
                        }
                    } .foregroundColor(colorPrimario)
                }
            }.listRowBackground(colorDeFondo)
        }
        .navigationTitle(recipe.recipeBasicInfo.titulo)
        .toolbar {
            ToolbarItem {
                HStack {
                    Button("Editar") {
                        isPresenting = true
                    }
                    //Marcar recetas como favoritas parte #2
                    Button(action: {
                        recipe.isFavorite.toggle()
                    }) {
                        Image(systemName: recipe.isFavorite ? "heart.fill" : "heart")
                    }
                }
            }
        }
        .sheet(isPresented: $isPresenting) {
            NavigationView {
                ModifyRecipeView(recipe: $recipe, isPresenting: $isPresenting)
                    .toolbar {
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Guardar") {
                                isPresenting = false
                                recipeData.saveRecipes()
                            }
                        }
                    }
                    .navigationTitle("Editar Receta")
            }
        }
    }
}





// Para mostrar cree una propiedad que muestre la primera receta de backrecipes
// Use recipe para inicializar y mostrar una inst de la view

struct RecipeDetailsView_Previews: PreviewProvider {
    @State static var recipe = Recipe.backRecipes[0]
    static var previews: some View {
        NavigationView {
            RecipeDetailsView(recipe: $recipe)
        }
    }
}
