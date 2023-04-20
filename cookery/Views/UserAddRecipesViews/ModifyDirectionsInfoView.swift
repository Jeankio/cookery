import SwiftUI

//Ajustar a ModifyComponent - Nuevo Init
struct ModifyDirectionView: ModifyComponentView {
    
    @Binding var preparacion: Preparacion
    let createAction: (Preparacion) -> Void
    //Init
    init(component: Binding<Preparacion>, createAction: @escaping (Preparacion) -> Void) {
        self._preparacion = component
        self.createAction = createAction
    }
    
    private let listBackgroundColor = Colores.fondo
    private let listTextColor = Colores.primario
    
    @Environment(\.presentationMode) private var mode
    
    var body: some View {
        Form(content: {
            TextField("Paso de la Preparacion", text: $preparacion.paso)
                .listRowBackground(listBackgroundColor)
            Toggle("Preparación opcional", isOn: $preparacion.opcional)
                .listRowBackground(listBackgroundColor)
            HStack{
                Spacer()
                Button("Save") {
                    createAction(preparacion)
                    mode.wrappedValue.dismiss()
                }
                Spacer()
            }.listRowBackground(listBackgroundColor)
        })
        .foregroundColor(listTextColor)
    }
}


struct ModifyDirectionView_Previews: PreviewProvider {
    @State static var emptyPreparacion = Preparacion(paso: "", opcional: false)
    static var previews: some View {
        NavigationView {
            ModifyDirectionView(component: $emptyPreparacion) { _ in return }
        }
    }
}
