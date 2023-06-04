//
//  User+CoreDataProperties.swift
//  ReverberateSwiftUI
//
//  Created by arun-13930 on 04/06/23.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var id: String?
    @NSManaged public var email: String?
    @NSManaged public var password: String?
    @NSManaged public var name: String?
    @NSManaged public var phone: String?
    @NSManaged public var profilePicture: Data?
    @NSManaged public var favouriteAlbumsData: Data?
    @NSManaged public var favouriteArtistsData: Data?
    @NSManaged public var favouriteSongsData: Data?
    @NSManaged public var playlistsData: Data?
    @NSManaged public var preferredGenres: [Int16]?
    @NSManaged public var preferredLanguages: [Int16]?

}

extension User : Identifiable {

}
