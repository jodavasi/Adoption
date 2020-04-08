//
//  Province.swift
//  Adoption
//
//  Created by MAC on 4/7/20.
//  Copyright © 2020 jodavasi. All rights reserved.
//

import Foundation
import RealmSwift


class Province: Object{
    
    
    @objc dynamic var identifier = NSUUID().uuidString
    @objc dynamic var name = ""
    @objc dynamic var imageProvince = ""
    
    let pet = List<Pet>()
    
    convenience init(name: String, imageName:String){
        self.init()
        self.name = name
        self.imageProvince = imageName
    }
    
    override static func primaryKey() -> String? {
        return "identifier"
    }
    
    override static func indexedProperties() -> [String] {
        return ["identifier"]
    }
    
    
    
}
