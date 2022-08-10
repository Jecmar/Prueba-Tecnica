import SwiftUI

struct DatePickerCustom: View {
    @Binding var textBinding: String
    @Binding var date: Date
    
    var body: some View {
        HStack{
            Text("\(textBinding)")
                .foregroundColor(Color.black)
            
            DatePicker(
                "",
                selection: $date,
                in: ...Date(),
                displayedComponents: [.date]
            )
        }
        .frame(width: 260, height: 30)
        .padding(.vertical, 10)
        .padding(.horizontal, 22)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

struct DatePickerCustom_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerCustom(textBinding: .constant("Nacimiento:"),date: .constant(Date()))
    }
}
