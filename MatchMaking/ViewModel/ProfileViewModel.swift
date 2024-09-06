//
//  ProfileViewModel.swift
//  MatchMaking
//
//  Created by Shivam Ratnam on 05/09/24.
//

import SwiftUI
import CoreData

class ProfileViewModel: ObservableObject {
    @Published var profiles: [ProfileModel] = []
    var profileView = ProfileModel.self
    let coreData = CoreDataManager()
    func fetchProfiles() {
        guard let url = URL(string: "https://randomuser.me/api/?results=20") else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(ProfileResponse.self, from: data)
                    DispatchQueue.main.async {
                        for result in result.results{
                            var model =   ProfileModel(id: result.login.uuid,
                                                       name: "\(result.name.first) \(result.name.last)",
                                                       age: result.dob.age,
                                                       location: "\(result.location.city), \(result.location.country)",
                                                       imageURL: result.picture.large, status: "")
                            print(result)
                            self.coreData.saveProfile(model)
                            
                        }
                      
                    }
                    
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }.resume()
    }
    
}
