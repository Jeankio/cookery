// MArcar recetas favoritas #3

import SwiftUI


struct MainTabView: View {
    @StateObject var recipeData = RecipeData()
    
    var body: some View {
        TabView{
            RecipeCategoryView()
                .tabItem { Label("Recetas", systemImage: "fork.knife.circle") }
            NavigationView {
                VStack {
                    CookerProfileView()
                    RecipesListView(viewStyle: .favorites)
                }.padding(.bottom, 280)
            }.tabItem{ Label("Perfil", systemImage: "person.crop.circle.fill") }
            // SE AGREGÓ PARA ACCEDER A LOS SETTINGS O AJUSTES
            SettingsView()
                    .tabItem { Label("Ajustes", systemImage: "gear") }
        }
        .environmentObject(recipeData)
    }
}




struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
