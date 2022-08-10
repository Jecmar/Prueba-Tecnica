import SwiftUI
import SwiftyJSON
import SDWebImageSwiftUI

struct ListNews: View {
    @Environment (\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject var news = getNews()
//    @FetchRequest(sortDescriptors: []) var getNewsApi: FetchedResults<New>
    
    var body: some View {
        NavigationView{
            VStack{
                ScrollView{
                    VStack(alignment: .center, spacing: 6){
                        ForEach(news.data, id:\.id){new in
                            NavigationLink(destination:
                                WebView(url: new.url!)
                                .navigationBarColor(backgroundColor: Color("toolbarBackgroundBlue"), titleColor: .white)
                                .navigationBarTitle("", displayMode: .inline)
                                .navigationBarBackButtonHidden(true)
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
                                }
                            ){
                                ZStack{
                                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                                    .fill(.white)
                                    
                                    HStack{
                                        VStack(alignment: .center){
                                            WebImage(url: URL(string: new.urlImage!), options: .highPriority, context: nil)
                                                .resizable()
                                                .clipShape(RoundedRectangle(cornerRadius: 25))
                                                .frame(maxWidth: .infinity, maxHeight: 150)
                                            
                                            Text("\(new.title!)")
                                                .foregroundColor(Color.black)
                                                .bold()
                                                .padding(.leading, 10)
                                                .padding(.top, 5)
                                                
                                            Text("\(new.description!)")
                                                .foregroundColor(Color.black)
                                                .padding(.leading, 10)
                                                .padding(.top, 5)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 10)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(Color("backgroundGray"))
            .navigationBarTitle(Text("Noticias de Lactancia"), displayMode: .inline)
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
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct ListNews_Previews: PreviewProvider {
    static var previews: some View {
        ListNews()
    }
}
