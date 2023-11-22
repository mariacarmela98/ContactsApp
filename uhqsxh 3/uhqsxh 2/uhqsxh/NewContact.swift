import SwiftUI

struct NewContact: View {
    @State private var nome: String = ""
    @State private var cognome : String = ""
    @State private var società : String = ""
    @Binding var isPresented: Bool
    
    var body: some View {
       
        ZStack {
        Color("sfondo").ignoresSafeArea()

        VStack {
            HStack {
                Button(action: {
                    isPresented.toggle()
                }) {
                    Text("Annulla")
                        .padding(.leading, 20.0)
                }
                Spacer()
                
                Text("Nuovo contatto")
                    .font(.system(size: 18))
                    .multilineTextAlignment(.center)
                    .lineLimit(1)
                    .bold()
                    .padding(.trailing, 22.0)
                    .frame(maxWidth: .infinity, alignment: .center)
                Spacer()
                Button(action: {
                    // Azione per Fine
                }) {
                    Text("Fine")
                        .padding(.trailing, 20.0)
                        .foregroundStyle(.gray)
                }
            }
            .padding(.top, 40) // Aggiunto spazio in alto
            
            Spacer()
            
            
            // VStack {
                Spacer()
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .foregroundColor(Color.gray)
                    .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                    .frame(width: 150, height: 150)
                    .padding(.bottom, 10.0)
                   
                
                
                Button(action: {
                    // Azione per aggiungere foto
                }) {
                    Text("Aggiungi foto")
                        .foregroundColor(.black)
                        .font(.system(size: 17).bold())
                        .frame(width: 170.0, height: 40.0)
                        .background(Color(red: 211/255.0, green: 211/255.0, blue: 211/255.0))
                        .cornerRadius(17.0)
                    
                }
                .padding()
                
            
            
            ZStack{
                
                Rectangle()
                     .fill(Color.white)
                VStack{
                    Divider()
                    
                    TextField("Nome", text: $nome)
                        .padding(.leading, 20.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Divider()
                    
                    TextField("Cognome", text: $cognome)
                        .padding(.leading, 20.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Divider()
                    
                    TextField("Società", text: $società)
                        .padding(.leading, 20.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Divider()
                }
            }
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                
                    ZStack{
                        Rectangle()
                            .stroke()
                            .frame(width: 390.0, height: 40.0,alignment: .leading)
                            .foregroundStyle(Color.gray)
                            .opacity(0.2)
                        HStack{
                            Button(action: {
                                // Azione per aggiungere telefono
                            }) {
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(Color.green)
                                
                            }
                            
                            
                            
                            Text("Aggiungi telefono")
                                .frame(width: 350, height: 40, alignment: .leading)
                        }
                    }
                .background(Color.white)
                
            //}
            .padding(.bottom, 280.0)
        }
    }
        
       
        }
}
struct NewContact_Previews: PreviewProvider {
    static var previews: some View {
        NewContact(isPresented: .constant(false))    }
}
