//
//  PostModel.swift
//  JsonPlaceHolderApp
//
//  Created by Fernando Gomes on 27/03/2022.
//

import UIKit
import CoreData

class PostCommand {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func addPostsToCoreData(newPosts postList: [PostDto]){
        
        deleteAllPost()
        
        for post in postList {
            let entity = NSEntityDescription.entity(forEntityName: Constants.postEntity, in: context)
            let newPost = NSManagedObject(entity: entity!, insertInto: context)
                    
            newPost.setValue(post.title, forKey: Constants.titleAttribute)
            newPost.setValue(post.body, forKey: Constants.bodyAttribute)
            newPost.setValue(post.id, forKey: Constants.idAttribute)
            newPost.setValue(post.userId, forKey: Constants.userIdAttribute)
            newPost.setValue(post.favorite, forKey: Constants.favoriteAttribute)
        }
        
        do{
            try context.save()
        } catch {
            print("error")
        }
        
        
    }
    
    func getAllPosts() -> [Post]{
        let all : NSFetchRequest<Post> = Post.fetchRequest()
        var idSort = NSSortDescriptor(key:Constants.idAttribute, ascending:true)
        var allPosts = [Post]()
        all.sortDescriptors = [idSort]
        do {
            let fetched = try context.fetch(all)
            allPosts = fetched
        } catch{
            let nserror = error as NSError
                print(nserror)
        }
                
        return allPosts
    }

    func deletePost(post : Post){

        do {
            context.delete(post)
            try context.save()
            
        } catch {
            let nserror = error as NSError
            print(nserror.description)
        }

    }
    
    func deleteAllPost(){
         do {
             let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: Constants.postEntity)
             let deleteALL = NSBatchDeleteRequest(fetchRequest: deleteFetch)

             try context.execute(deleteALL)
             try context.save()
         } catch {
             print ("error")
         }
    }
}
