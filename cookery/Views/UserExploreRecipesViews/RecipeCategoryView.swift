//
//
//
//
//
//

import SwiftUI

struct RecipeCategoryView: View {
    //Propiedad para acceder al model por medio del viewModel
    //private var recipeData = RecipeData()
    @StateObject private var recipeData = RecipeData()
    
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
                .navigationTitle("Categorías")
            } //Scview
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: CookerProfileView()) {
                        Image(systemName: "person.circle")
                            .foregroundColor(.black)
                    }
                    
                }
            } //Toolbar
        } //Nview
    } //Body
} // Struct RCV


struct CategoryView: View {
    let category: RecipeBasicInfo.Category
    
    var body: some View {
        ZStack {
            Image(category.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.50)
            Text(category.rawValue)
                .font(.title.bold())
        } .padding()
    }
}


struct RecipeCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCategoryView()
    }
}
