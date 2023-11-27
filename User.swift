//
//  User.swift
//  duetVersion3
//
//  Created by Clay Olson on 11/27/23.
//

import Foundation
import UIKit



class User: NSObject {
    var name: String
    var thingsToBring: String
    var topArtists: String
    var topGenres: String
    var aboutUser: String
    var guiltyPleasure: String
    var userPicture: UIImage

    init(name: String, thingsToBring: String, topArtists: String, topGenres: String, aboutUser: String, guiltyPleasure: String, userPicture: UIImage) {
        self.name = name
        self.thingsToBring = thingsToBring
        self.topArtists = topArtists
        self.topGenres = topGenres
        self.aboutUser = aboutUser
        self.guiltyPleasure = guiltyPleasure
        self.userPicture = userPicture
    }

    override func isEqual(_ object: Any?) -> Bool {
        guard let otherUser = object as? User else {
            return false
        }

        // Compare all properties for equality
        return self.name == otherUser.name &&
               self.thingsToBring == otherUser.thingsToBring &&
               self.topArtists == otherUser.topArtists &&
               self.topGenres == otherUser.topGenres &&
               self.aboutUser == otherUser.aboutUser &&
               self.guiltyPleasure == otherUser.guiltyPleasure &&
               self.userPicture.isEqual(otherUser.userPicture)
    }
}
