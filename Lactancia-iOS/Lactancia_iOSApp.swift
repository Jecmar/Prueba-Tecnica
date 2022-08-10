import SwiftUI

@main
struct Lactancia_iOSApp: App {
    @StateObject private var dataController = DataController()
    @StateObject private var newsDataController = NewsDataController()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environment(\.managedObjectContext, newsDataController.container.viewContext)
        }
    }
}
