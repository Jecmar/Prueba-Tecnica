import Foundation
import SwiftyJSON
import SwiftUI

class getNews: ObservableObject{
    @Environment (\.managedObjectContext) var managedObjectContext
    @Published var data = [NewsModel]()
    
    init(){
        let source = "https://newsapi.org/v2/everything?q=Lactancia&sortBy=popularity&apiKey=f5f76f59185e42b4bbcd609a967f7ca5"
        let url = URL(string: source)!
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: url){(data, _, error) in
            if error != nil{
                print("Error \(error?.localizedDescription)")
                return
            }
            
            let json = try! JSON(data: data!)
            
            for new in json["articles"]{
                let title = new.1["title"].stringValue
                let description = new.1["description"].stringValue
                let url = new.1["url"].stringValue
                let image = new.1["urlToImage"].stringValue
                
                DispatchQueue.main.async {
//                    NewsDataController().saveNews(title: title, description: description, url: url, urlImage: image, context: self.managedObjectContext)
                    self.data.append(NewsModel(id: UUID(), title: title, description: description, url: url, urlImage: image))
                }
            }
        }.resume()
    }
    
}
