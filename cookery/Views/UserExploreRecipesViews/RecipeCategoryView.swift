//


import SwiftUI

struct RecipeCategoryView: View {
    //Propiedad para acceder al model por medio del viewModel
    //private var recipeData = RecipeData()
    
    //Marcar favoritos #4 como tab main ahora es principal entonces:
    @EnvironmentObject private var recipeData: RecipeData
    
    @State private var isPresenting = false
    @State private var newRecipe = Recipe()
    
    var body: some View {
        let columns = [GridItem()]
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, content: {
                    ForEach(RecipeBasicInfo.Category.allCases,
                            id: \.self) { category in
                        // Presentando - conectando la lista de recetas a las categorias
                        NavigationLink(
                            destination: RecipesListView(category: category)
                                            .environmentObject(recipeData),
                            label: {
                                CategoryView(category: category)
                                    //.underline()
                            })
                        .foregroundColor(.black)
                    }
                })
                .navigationTitle("¿Qué cocinarás hoy?")
            } //Scview
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Cookery")
                        .font(.headline)
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: CookerProfileView()) {
                        Image(systemName: "person.circle")
                            .foregroundColor(.black)
                    }
                }
                //PREGUNTAR
                ToolbarItem (placement: .navigationBarTrailing) {
                    Button(action: {
                        isPresenting = true
                    }, label: {
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                    })
                }
            } //Toolbar
        } //Nview
        .sheet(isPresented: $isPresenting, content: {
            NavigationView {
                ModifyRecipeView(recipe: $newRecipe, isPresenting: $isPresenting)
                    .navigationTitle("Agrega una Receta")
            }
        })
    } //Body
} // Struct RCV


struct CategoryView: View {
    let category: RecipeBasicInfo.Category
    
    var body: some View {
        ZStack {
            Image(category.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                //.opacity(0.40)
                .cornerRadius(15)
            
            VStack {
                //Spacer()
                HStack {
                    //Spacer()
                    Text(category.rawValue)
                        .font(.title.bold())
                        .padding()
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(15)
                }
            }
        } .padding()
    }
}


// Func para encapsular .sheet 






struct RecipeCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCategoryView()
    }
}
