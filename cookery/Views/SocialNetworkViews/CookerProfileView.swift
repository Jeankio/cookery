

import SwiftUI

struct CookerProfileView: View {
    //@Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Spacer()
            CookerProfile(
                photoCooker: Image(systemName: "photo.circle"),
                name: "Magaly Gutierry",
                subText: "Vegan Cooker"
            ).padding()
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Cooker Profile")
                    .font(.headline)
            }
        }
        /*.navigationBarBackButtonHidden(true)
         .navigationBarItems(leading:
         Button(action: {
         presentationMode.wrappedValue.dismiss()
         }) {
         Image(systemName: "arrow.backward")
         .foregroundColor(.black)
         .imageScale(.large)
         }
         )
         }*/
    }
}

struct CookerProfile: View {
    var photoCooker: Image
    var name: String
    var subText: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            photoCooker
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            VStack(alignment: .center) {
                Text(name)
                    .font(.headline)
                Text(subText)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
    }
}



struct CookerProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CookerProfileView()
        }
    }
}
