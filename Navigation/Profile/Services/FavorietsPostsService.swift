//
//  FavorietsPostsService.swift
//  Navigation
//
//  Created by Apple Mac Air on 20.03.2024.
//

import CoreData
import StorageService

final class FavorietsPostsService {
    
    private let coreDataService: ICoreDataService = CoreDataService.shared
    
    private(set) var posts = [FavorietsPosts]()
    
    init() {
        fetchItems()
    }
    
    func fetchItems() {
        let request = FavorietsPosts.fetchRequest()
        do {
            posts = try coreDataService.context.fetch(request)
        } catch {
            print(error)
        }
    }
    
    func createItem(with post: Post) {
        let newItem = FavorietsPosts(context: coreDataService.context)
        newItem.author = post.author
        newItem.descriptionText = post.descriptionText
        newItem.image = post.image
        coreDataService.saveContext()
        fetchItems()
    }
    
    func deleteItem(at index: Int) {
        coreDataService.context.delete(posts[index])
        coreDataService.saveContext()
        fetchItems()
    }
}
