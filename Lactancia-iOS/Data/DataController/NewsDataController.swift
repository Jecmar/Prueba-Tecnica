import Foundation
import CoreData

class NewsDataController: ObservableObject{
    let container = NSPersistentContainer(name: "NewsModel")
    
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
    
    func saveNews(title: String, description: String, url: String, urlImage: String, context: NSManagedObjectContext){
        let news = New(context: context)
        
        news.id = UUID()
        news.title = title
        news.descriptionD = description
        news.url = url
        news.urlImage = urlImage
        
        print("Data \(title)")
//        save(context: context)
    }
}
