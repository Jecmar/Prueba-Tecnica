import Foundation

class AddBabyRequestBaby: ObservableObject{
    @Published var babyName: String = ""
    @Published var birthDay: String = ""
    @Published var gender: String = ""
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }
    
    var isNotEmptyName: Bool{
        !babyName.isEmpty
    }
    
    var isNotEmptyBirthday: Bool{
        !birthDay.isEmpty
    }
    
    var isNotEmptyGender: Bool{
        !gender.isEmpty
    }
    
    var isValid: Bool{
        self.isNotEmptyName && self.isNotEmptyBirthday && self.isNotEmptyGender
    }
}
