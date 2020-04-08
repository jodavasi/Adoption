//
//  Pets.swift
//  Adoption
//
//  Created by MAC on 4/7/20.
//  Copyright © 2020 jodavasi. All rights reserved.
//

import Foundation
import RealmSwift


class Pet: Object{
    @objc dynamic var mote = ""
    @objc dynamic var ownerName = ""
    @objc dynamic var phoneNumber = ""
    @objc dynamic var animalType = ""
    
    let provinces = LinkingObjects(fromType: Province.self, property: "pet")

    convenience init(mote: String, ownerName: String, phoneNumber: String, animalType: String) {
        self.init()
        self.mote = mote
        self.ownerName = ownerName
        self.phoneNumber = phoneNumber
        self.animalType = animalType
    }

    
    
}

