//
//  RealmManager.swift
//  Adoption
//
//  Created by MAC on 4/8/20.
//  Copyright © 2020 jodavasi. All rights reserved.
//

import Foundation
import RealmSwift

class RealmManager {
    
    func insertProvince(name: String, imageName: String) {
        let province = Province(name: name, imageName: imageName)
        do {
            //let realm = try! Realm() esto es incorrecto xq esta haciendo un forze unwrap, si por alguna razon es nulo, la aplicación se va a caer
            let realm = try Realm()
            try realm.write {
                realm.add(province, update: .all)
            }
        } catch {
            print("Realm falló por alguna razón")
        }
    }
    
    func addNewsPet(pets: Pet, province: Province) {
        do {
            //let realm = try! Realm() esto es incorrecto xq esta haciendo un forze unwrap, si por alguna razon es nulo, la aplicación se va a caer
            let realm = try Realm()
            try realm.write {
                province.pet.append(pets)
            }
        } catch {
            print("Realm falló por alguna razón")
        }
    }
    
    
    func removePets(pets: Pet) {
        do {
            //let realm = try! Realm() esto es incorrecto xq esta haciendo un forze unwrap, si por alguna razon es nulo, la aplicación se va a caer
            let realm = try Realm()
            try realm.write {
                realm.delete(pets)
            }
        } catch {
            print("Realm falló por alguna razón")
        }
    }
    
    
    //Obtiene todas las categorias de forma syncrona
    func getAllProvinces() -> Results<Province>? {
        let realm = try? Realm()
        return realm?.objects(Province.self)
    }
    
    //Obtiene todas las categorias de forma asyncrona
    func getAllProvinces(completionHandler:(_ provinces: Results<Province>?) -> Void) {
        completionHandler(getAllProvinces())
    }
}

