import SwiftUI

struct AddBaby: View {
    @Environment (\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment (\.managedObjectContext) var managedObjectContext
    
    @State var babyName: String = ""
    @State var birthDay: Date = Date()
    @State private var imageData: Data?
    @State private var optionalData = UIImage(named: "avatar_bebe")?.jpegData(compressionQuality: 1)
    @State var isSelectBoy: Bool = false
    @State var isSelectGirl: Bool = false
    @State var showSheet: Bool = false
    
    @StateObject var credentials = AddBabyRequestBaby()
    
    var body: some View {
    NavigationView{
        VStack{
            ZStack(alignment: .center){
                Image(uiImage: UIImage(data: (imageData ?? optionalData)!)!)
                    .resizable()
                    .frame(width: 110, height: 110, alignment: .center)
                    .clipShape(Circle())
                
                Button(action:{
                    showSheet = true
                }){
                    Image("b_editar_avatar")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding(.leading, 105)
                }
            }
            .padding(.top, 10)
            
            TextFieldCustom(textBinding: .constant("Nombre:"),valueBinding: $babyName)
                .padding(.top, 50)
                .padding(.bottom, 30)
                .onChange(of: babyName){nameValue in
                    credentials.babyName = nameValue
                }
            
            DatePickerCustom(textBinding: .constant("Nacimiento:"), date: $birthDay)
                .padding(.bottom, 30)
                .onChange(of: birthDay){birtdayValue in
                    credentials.birthDay = credentials.dateFormatter.string(from: birtdayValue)
                }
            
            HStack{
                SelectButtons(isSelect: $isSelectBoy, setText: "Niño")
                    .onTapGesture {
                        isSelectBoy.toggle()
                        credentials.gender = "B"
                        
                        if isSelectBoy{
                            isSelectGirl = false
                        }
                    }
                
                Spacer()
                
                SelectButtons(isSelect: $isSelectGirl, setText: "Niña")
                    .onTapGesture {
                        isSelectGirl.toggle()
                        credentials.gender = "G"
                        
                        if isSelectGirl{
                            isSelectBoy = false
                        }
                    }
            }
            .frame(maxWidth: 170, alignment: .center)
            .padding(.horizontal, 30)
            
            Spacer()
            
            HStack{
                Button(action: {
                    
                }){
                    Text("Limpiar")
                        .foregroundColor(Color.white)
                }
                .frame(width: 150, height: 50, alignment: .center)
                .padding(6)
                .background(Color("orange"))
                .clipShape(RoundedRectangle(cornerRadius: 28))
                
                Spacer()
                
                Button(action: {
                    if !credentials.isValid { return }
                    DataController().saveBaby(name: credentials.babyName, birthday: birthDay, gender: credentials.gender, image: imageData, context: managedObjectContext)
                    presentationMode.wrappedValue.dismiss()
                    
                }){
                    Text("Guardar")
                        .foregroundColor(Color.white)
                }
                .frame(width: 150, height: 50, alignment: .center)
                .padding(6)
                .background(Color("orange"))
                .clipShape(RoundedRectangle(cornerRadius: 28))
                .disabled(!credentials.isValid)
                .opacity(!credentials.isValid ? 0.6 : 1)
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 15)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("backgroundBlue"))
        .navigationBarTitle(Text("Agregar Bebe"), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarColor(backgroundColor: Color("toolbarBackgroundBlue"), titleColor: .white)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading){
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }){
                    Image("atras_sn")
                        .resizable()
                        .foregroundColor(Color.white)
                        .frame(width: 24, height: 24)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing){
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }){
                    Image("home_sn")
                        .resizable()
                        .foregroundColor(Color.white)
                        .frame(width: 24, height: 24)
                }
            }
        }
        .sheet(isPresented: $showSheet){
            ImagePicker(data: $imageData)
        }
    }
    .navigationBarHidden(true)
    .navigationBarBackButtonHidden(true)
    }
}

struct NewBaby_Previews: PreviewProvider {
    static var previews: some View {
        AddBaby()
    }
}
