import SwiftUI

struct HomeView: View {
    @State var showMyBaby: Bool = false
    @State var showAddBaby: Bool = false
    @State var showListNews: Bool = false
    @FetchRequest(sortDescriptors: []) var babies: FetchedResults<Baby>
    
    var body: some View {
        NavigationView{
            VStack{
//                Views
                NavigationLink(destination: MyBaby(), isActive: $showMyBaby){ EmptyView() }
                NavigationLink(destination: AddBaby(), isActive: $showAddBaby){ EmptyView() }
                NavigationLink(destination: ListNews(), isActive: $showListNews){ EmptyView() }
                
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 130.0, height: 130.0)
                    .padding(.bottom, 40)
                
                HStack{
                    VStack{
                        Button(action:{
                            if babies.isEmpty{
                                showAddBaby = true
                            }else{
                                showMyBaby = true
                            }
                        }){
                            VStack{
                                Image("mibebe")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 110.0, height: 110.0)
                                
                                Text("Mi Bebe")
                                    .foregroundColor(Color.black)
                            }
                        }
                    }
                    
                    Spacer()
                    
                    VStack{
                        Button(action:{
                            showListNews = true
                        }){
                            VStack{
                                Image("comolactar")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 110.0, height: 110.0)
                                
                                Text("¿Como lactar?")
                                    .foregroundColor(Color.black)
                            }
                        }
                    }
                }
                .padding(.horizontal, 50)
                .frame(maxWidth: .infinity)
                
                HStack{
                    VStack{
                        Image("problemas")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 110.0, height: 110.0)
                        
                        Text("¿Problemas?")
                    }
                    
                    Spacer()
                    
                    VStack{
                        Image("sugerencias")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 110.0, height: 110.0)
                        
                        Text("Sugerencias")
                    }
                }
                .padding(.horizontal, 50)
                .padding(.top,20)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(Color("backgroundGray"))
            .navigationBarTitle(Text(""), displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        
                    }, label: {
                        Image("info")
                    })
                }
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
