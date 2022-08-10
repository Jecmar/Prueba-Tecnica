import SwiftUI
import SDWebImageSwiftUI

struct NewsCard: View {
    @State var isActive: Bool = false
    
    let title: String
    let description: String
    let urlImage: String
    let url: String
    
    var body: some View {
        NavigationLink(destination:
            WebView(url: url)
            .navigationBarColor(backgroundColor: Color("toolbarBackgroundBlue"), titleColor: .white)
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    Button(action: {
                    }){
                        Image("atras_sn")
                            .resizable()
                            .foregroundColor(Color.white)
                            .frame(width: 24, height: 24)
                    }
                }
            }
        ){
            HStack{
                VStack(alignment: .center){
                    WebImage(url: URL(string: urlImage), options: .highPriority, context: nil)
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        .frame(maxWidth: .infinity, maxHeight: 150)
                    
                    Text("\(title)")
                        .foregroundColor(Color.black)
                        .bold()
                        .padding(.leading, 10)
                        .padding(.top, 5)
                        
                    Text("\(description)")
                        .foregroundColor(Color.black)
                        .padding(.leading, 10)
                        .padding(.top, 5)
                }
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.vertical, 15)
            .padding(.horizontal, 10)
            .foregroundColor(Color.black)
            .overlay(RoundedRectangle(cornerRadius: 25.0)
                        .stroke( Color.gray, lineWidth: 1)
            )
            .background(Color.white)
        }
    }
}
