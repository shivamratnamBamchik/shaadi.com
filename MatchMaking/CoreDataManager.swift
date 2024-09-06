//
//  CoreDataManager.swift
//  MatchMaking
//
//  Created by Shivam Ratnam on 05/09/24.
//
import CoreData
import SwiftUI

class CoreDataManager {
    let context = PersistenceController.shared.container.viewContext
     func saveProfile(_ profile: ProfileModel) {
        let savedProfile = SavedProfile(context: context)
        savedProfile.id = profile.id
        // print(profile.id)
        savedProfile.name = profile.name
        savedProfile.age = Int16(profile.age)
        savedProfile.location = profile.location
        savedProfile.imageURL = profile.imageURL
        savedProfile.status = profile.status
        
        do {
            try context.save()
        } catch {
            print("Error saving profile: \(error)")
        }
    }
    func updateProfile(_ id: String,_ status: String) {
        let fetchRequest = NSFetchRequest<SavedProfile>(entityName: "SavedProfile")

        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
        
        do {
            let results = try context.fetch(fetchRequest)
            
            if let existingProfile = results.first {
                
                existingProfile.status = status
           }
            
            try context.save()
        } catch {
            print("Error updating profile: \(error)")
        }
    }
    
}


