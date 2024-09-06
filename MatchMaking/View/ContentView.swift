//
//  ContentView.swift
//  MatchMaking
//
//  Created by Shivam Ratnam on 05/09/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @StateObject private var viewModel = ProfileViewModel()
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) private var savedProfiles: FetchedResults<SavedProfile>
    let coreData = CoreDataManager()

    var body: some View {
        NavigationView {
            List {
                ForEach(savedProfiles) { profile in
                    let Allprofiles =  ProfileModel(
                      id: profile.id ?? "",
                      name: profile.name ?? "",
                          age: Int(profile.age),
                      location: profile.location ?? "",
                      imageURL: profile.imageURL ?? "",
                          status: profile.status)
                      
                    ProfileCardView(profile: Allprofiles) { accepted,id  in
                        print(accepted)
                        if accepted {
                            coreData.updateProfile(id, "Accepted")
                            
                        } else{
                            coreData.updateProfile(id, "Declined")

                        }
                    }
                   
                }
            }
            .navigationTitle("Profile Matches")
            .onAppear {
                viewModel.fetchProfiles()
            }
        }
    }

}


#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
