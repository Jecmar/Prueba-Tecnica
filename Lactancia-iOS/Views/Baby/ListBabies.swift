import SwiftUI

struct ListBabies: View {
    @Environment (\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: []) var babies: FetchedResults<Baby>
    
    @State private var optionalData = UIImage(named: "avatar_bebe")?.jpegData(compressionQuality: 1)
    @State var isActive: Bool = false
    
    init() {
       UITableView.appearance().separatorStyle = .none
       UITableViewCell.appearance().backgroundColor = UIColor(Color("backgroundGray"))
       UITableView.appearance().backgroundColor = UIColor(Color("backgroundGray"))
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(babies, id: \.id){baby in
                        NavigationLink(destination: EditBaby(baby: baby)){
                            HStack{
                                VStack(alignment: .center){
                                    Image(uiImage: UIImage(data: ((baby.image ?? optionalData)!))!)
                                        .resizable()
                                        .frame(width: 100, height: 100, alignment: .center)
                                        .clipShape(Circle())
                                }
                                VStack(alignment: .leading){
                                    Text("Nombre: \(baby.name!)")
                                        .foregroundColor(Color.black)
                                        .bold()
                                        .padding(.leading, 10)
                                        .padding(.top, 5)
                                        
                                    Text("Nacimiento: \(AddBabyRequestBaby().dateFormatter.string(from: baby.birthday!))")
                                        .foregroundColor(Color.black)
                                        .padding(.leading, 10)
                                        .padding(.top, 2)
                                }
                            }
                            .padding(.vertical, 10)
                        }
//                            ZStack{
//                                RoundedRectangle(cornerRadius: 25, style: .continuous)
//                                .fill(.white)
//
////                                NavigationLink(destination: EditBaby(baby: baby)){
////                                    HStack{
////                                        VStack(alignment: .center){
////                                            Image(uiImage: UIImage(data: ((babies.first?.image! ?? optionalData)!))!)
////                                                .resizable()
////                                                .frame(width: 110, height: 110, alignment: .center)
////                                                .clipShape(Circle())
////
////                                            Text("\(baby.name!)")
////                                                .foregroundColor(Color.black)
////                                                .bold()
////                                                .padding(.leading, 10)
////                                                .padding(.top, 5)
////
////                                            Text("\(baby.birthday!)")
////                                                .foregroundColor(Color.black)
////                                                .padding(.leading, 10)
////                                                .padding(.top, 5)
////                                        }
////                                    }
////                                    .padding(.vertical, 10)
////                                }
//                            }
                        
                    }
                    .onDelete(perform: deleteBaby)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(Color("backgroundGray"))
            .navigationBarTitle(Text("Mis bebes"), displayMode: .inline)
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
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    private func deleteBaby(offset: IndexSet){
        withAnimation{
            offset.map{babies[$0]}.forEach(managedObjectContext.delete)
            DataController().save(context: managedObjectContext)
        }
    }
}
