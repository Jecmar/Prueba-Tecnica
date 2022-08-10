import SwiftUI

struct TextFieldCustom: View {
    @Binding var textBinding: String
    @Binding var valueBinding: String
    
    var body: some View {
        HStack{
            Text("\(textBinding)")
                .foregroundColor(Color.black)
            
            Spacer()
            
            TextField("", text: $valueBinding)
                .foregroundColor(Color.black)
                .padding(.vertical, 10)
                .padding(.horizontal, 22)
        }
        .frame(width: 260, height: 30)
        .padding(.vertical, 10)
        .padding(.horizontal, 22)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}
