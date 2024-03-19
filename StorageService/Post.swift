

public struct Post {
    
    public var author: String
    public var descriptionText: String
    public var image: String
    public var likes: Int
    public var views: Int
    
    public init (author: String, descriptionText: String, image: String, likes: Int, views: Int) {
        self.author = author
        self.descriptionText = descriptionText
        self.image = image
        self.likes = likes
        self.views = views
    }
}
