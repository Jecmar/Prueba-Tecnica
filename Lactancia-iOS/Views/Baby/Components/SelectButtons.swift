import SwiftUI

struct SelectButtons: View {
    @Binding var isSelect: Bool
    @State var setText: String = ""
    
    var body: some View {
        ZStack{
            Capsule()
                .frame(width: 60,height: 60)
                .foregroundColor(isSelect ? Color.gray : Color.white)
            Text(setText)
                .foregroundColor(isSelect ? Color.white : Color.black)
        }
    }
}

struct SelectButtons_Previews: PreviewProvider {
    static var previews: some View {
        SelectButtons(isSelect: .constant(true), setText: "Niño")
    }
}
