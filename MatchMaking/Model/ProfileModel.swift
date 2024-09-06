//
//  ProfileModel.swift
//  MatchMaking
//
//  Created by Shivam Ratnam on 05/09/24.
//
import SwiftUI
struct ProfileModel: Identifiable, Codable {
    let id: String
    let name: String
    let age: Int
    let location: String
    let imageURL: String
    var status: String?
}

struct ProfileResponse: Codable {
    let results: [User]
}

struct User: Codable {
    let login: Login
    let name: Name
    let dob: Dob
    let location: Location
    let picture: Picture
}

struct Login: Codable {
    let uuid: String
}

struct Name: Codable {
    let first: String
    let last: String
}

struct Dob: Codable {
    let age: Int
}

struct Location: Codable {
    let city: String
    let country: String
}

struct Picture: Codable {
    let large: String
}


