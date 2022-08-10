import SwiftUI

struct MyBaby: View {
    @Environment (\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var age: Int = 0
    @State var showAddBaby: Bool = false
    @State var showListBabies: Bool = false
    @State var showEditBaby: Bool = false
    @State var image: UIImage = UIImage()
    @State private var optionalData = UIImage(named: "avatar_bebe")?.jpegData(compressionQuality: 1)
    
    @FetchRequest(sortDescriptors: []) var babies: FetchedResults<Baby>
    
    var body: some View {
        NavigationLink(destination: AddBaby(), isActive: $showAddBaby){ EmptyView() }
        NavigationLink(destination: ListBabies(), isActive: $showListBabies){ EmptyView() }
        NavigationLink(destination: EditBaby(baby: babies.first!), isActive: $showEditBaby){ EmptyView() }
        NavigationView{
            VStack{
                HStack{
                    VStack{
                        Button(action:{
                            showEditBaby = true
                        }){
                            Image("b_editar_avatar")
                                .resizable()
                                .frame(width: 50, height: 50, alignment: .center)
                        }
                        .padding(.bottom, 30)
                        
                        Button(action:{
                            showAddBaby.toggle()
                        }){
                            Image("agregar")
                                .resizable()
                                .frame(width: 50, height: 50, alignment: .center)
                        }
                        .padding(.top, 20)
                    }
                    
                    Spacer()
                    
                    Image(uiImage: UIImage(data: ((babies.first?.image! ?? optionalData)!))!)
                        .resizable()
                        .frame(width: 110, height: 110, alignment: .center)
                        .clipShape(Circle())
                    
                    Spacer()
                    
                    VStack{
                        Button(action:{}){
                            Image("calendario")
                                .resizable()
                                .frame(width: 50, height: 50, alignment: .center)
                        }
                        .padding(.bottom, 100)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.horizontal, 20)
                .padding(.top, 20)
                
                VStack{
                    Text("\(babies.first?.name ?? "")")
                        .foregroundColor(Color.black)
                        .bold()
                    
                    Text("\(AddBabyRequestBaby().dateFormatter.string(from: babies.first?.birthday ?? Date())) (\(age) años)")
                        .foregroundColor(Color.black)
                        .padding(.top,5)
                }
                .padding(.top, 30)
                
                Spacer()
                
                HStack(alignment: .center, spacing: 30){
                    VStack{
                        Image("registro")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80.0, height: 80.0,alignment: .center)
                        
                        Text("Registro")
                    }
                    
                    VStack{
                        Image("graficas")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80.0, height: 80.0,alignment: .center)
                        
                        Text("Graficas")
                    }
                    
                    VStack{
                        Button(action:{
                            showListBabies.toggle()
                        }){
                            Image("elegir_bebe")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80.0, height: 80.0,alignment: .center)
                        }
                        
                        Text("Elegir Bebe")
                    }
                }
                .padding(.bottom, 30)
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(Color("backgroundGray"))
            .navigationBarTitle(Text("Mi Bebe"), displayMode: .inline)
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
                        
                    }){
                        Image("home_sn")
                            .resizable()
                            .foregroundColor(Color.white)
                            .frame(width: 24, height: 24)
                    }
                }
            }
            .onAppear{
                age = convertAge()
//                image = UIImage(data: (babies.first?.image!)!)!
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    func convertAge() -> Int{
        let seconds = (Int64((babies.first?.birthday!.millisecondsSince1970)!)/1000) as NSNumber?
        let timeStampDate = Date(timeIntervalSince1970: seconds!.doubleValue)
        let calendar: NSCalendar! = NSCalendar(calendarIdentifier: .gregorian)
        let now = Date()
        let calcAge = calendar.components(.year, from: timeStampDate, to: now, options: [])
        let age = calcAge.year
        
        return age!
    }
}

extension Date {
//    Miliseconds
    var millisecondsSince1970: Int64 {
        Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }
}

//struct MyBaby_Previews: PreviewProvider {
//    static var previews: some View {
//        MyBaby()
//    }
//}
