// MArcar recetas favoritas #3

import SwiftUI


struct MainTabView: View {
    @StateObject var recipeData = RecipeData()
    
    var body: some View {
        TabView{
            RecipeCategoryView()
                .tabItem { Label("Recetas", systemImage: "fork.knife.circle") }
            NavigationView {
                RecipesListView(category: .desayuno)
            }.tabItem{ Label("Favoritas", systemImage: "heart.fill") }
        }
        .environmentObject(recipeData)
    }
}




struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
