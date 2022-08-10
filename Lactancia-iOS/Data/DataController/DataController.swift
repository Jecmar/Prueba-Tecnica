import Foundation
import CoreData

class DataController: ObservableObject{
    let container = NSPersistentContainer(name: "BabyModel")
    
    init(){
        container.loadPersistentStores{ desc, error in
            if let error = error{
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext){
        do{
            try context.save()
            print("Data saved!")
        }catch{
            print("We couldn't save the data")
        }
    }
    
    func saveBaby(name: String, birthday: Date, gender: String, image: Data?, context: NSManagedObjectContext){
        let baby = Baby(context: context)
        
        baby.id = UUID()
        baby.name = name
        baby.birthday = birthday
        baby.gender = gender
        baby.image = image
        
        save(context: context)
    }
    
    func editBaby(baby: Baby, name: String, birthday: Date, gender: String, image: Data?, context: NSManagedObjectContext){
        baby.name = name
        baby.birthday = birthday
        baby.gender = gender
        baby.image = image
        
        save(context: context)
    }
    
}
