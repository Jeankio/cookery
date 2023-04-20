import SwiftUI
//Protocol con inici vacio
protocol RecipeComponent: CustomStringConvertible {
    init()
    // para hacer que cada componente tenga su nombre (Ing y prep)
    static func singularName() -> String
    static func pluralName() -> String
}

extension RecipeComponent {
    // para hacer que cada componente tenga su nombre (Ing y prep)
    static func singularName() -> String {
        String(describing: self).lowercased()
    }
    static func pluralName() -> String {
        self.singularName() + "s"
    }
}

protocol ModifyComponentView: View {
    associatedtype Component
    init(component: Binding<Component>,
         createAction: @escaping (Component) -> Void)
}
//Where resuelve cannot convert binding
struct ModifyComponentsView<Component: RecipeComponent, DestinationView: ModifyComponentView>: View where
DestinationView.Component == Component {
    
  @Binding var components: [Component]
  @State private var newComponent = Component()
 
  private let listBackgroundColor = Colores.fondo
  private let listTextColor = Colores.primario
 
  var body: some View {
    VStack {
      let addComponentView = DestinationView(component: $newComponent) { component in
        components.append(component)
        newComponent = Component()
      }.navigationTitle("Agregar \(Component.singularName().capitalized)")
      if components.isEmpty {
        Spacer()
        NavigationLink("Agregar \(Component.singularName())", destination: addComponentView)
        Spacer()
      } else {
        HStack {
          Text(Component.pluralName().capitalized)
            .font(.title)
            .padding()
          Spacer()
        }
        List {
          ForEach(components.indices, id: \.self) { index in
            let component = components[index]
            Text(component.description)
              .listRowBackground(listBackgroundColor)
          }
          NavigationLink(destination: addComponentView) {
              Text("Agregar \(Component.singularName())")
          }.listRowBackground(listBackgroundColor)
        }.foregroundColor(listTextColor)
      }
    }
  }
}

 
struct ModifyIngredientsView_Previews: PreviewProvider {
  @State static var recipe = Recipe.backRecipes[1]
  @State static var emptyIngredients = [Ingrediente]()
  static var previews: some View {
    NavigationView {
      ModifyComponentsView<Ingrediente, ModifyIngredientsInfoView>(components: $recipe.ingredientes)
    }
  }
}
