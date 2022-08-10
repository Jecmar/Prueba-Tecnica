import Foundation

struct NewsModel: Codable{
    var id = UUID()
    var title: String? = nil
    var description: String? = nil
    var url: String? = nil
    var urlImage: String? = nil
}
