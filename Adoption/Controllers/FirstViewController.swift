//
//  ViewController.swift
//  Adoption
//
//  Created by MAC on 4/7/20.
//  Copyright © 2020 jodavasi. All rights reserved.
//

import UIKit
import RealmSwift

class FirstViewController: UIViewController {
   
    @IBOutlet weak var tableView: UITableView!
    let provinceCellIdentifier = "ProvinceCell"
    var provinces: Results<Province>?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        createCategories()
        registerCell()
        
    }
    
    func registerCell(){
        
        let nib = UINib(nibName: provinceCellIdentifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: provinceCellIdentifier)
    }
    
    func createCategories() {
        
        let realmManager = RealmManager()
            let provinces = realmManager.getAllProvinces()
            if let provinces = provinces, provinces.isEmpty {
                realmManager.insertProvince(name: "San Jose", imageName: "sanjose" )
                realmManager.insertProvince(name: "Alajuela", imageName: "alajuela" )
                realmManager.insertProvince(name: "Heredia", imageName: "heredia" )
                realmManager.insertProvince(name: "Cartago", imageName: "cartago" )
                realmManager.insertProvince(name: "Guanacaste", imageName: "guanaste" )
                realmManager.insertProvince(name: "Puntarenas", imageName: "Puntarenas" )
                realmManager.insertProvince(name: "Limon", imageName: "limon" )
                
                print("Provincias insertadas")
                createCategories()
            } else {
                self.provinces = provinces
                tableView.reloadData()
            }
        }
        
        
    }
    

extension FirstViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return provinces?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: provinceCellIdentifier)  as? ProvinceCell else {
            let cell = UITableViewCell()
            cell.textLabel?.text = "NO EXISTE"
            return cell
        }
        if let province = provinces?[indexPath.row] {
            cell.setupCell(province: province)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewController = storyboard?.instantiateViewController(identifier: "SecondViewController") as? SecondViewController, let province = provinces?[indexPath.row] {
            viewController.province = province
            navigationController?.pushViewController(viewController, animated: true)
        }
        
    
    }
}
    
    
    


