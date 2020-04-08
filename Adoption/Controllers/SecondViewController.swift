//
//  SecondViewController.swift
//  Adoption
//
//  Created by MAC on 4/7/20.
//  Copyright © 2020 jodavasi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    
    var province: Province?
    let petsCellIdentifier = "PetsCell"
    
    @IBOutlet weak var tableView: UITableView!
    
    let realmManager = RealmManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCustomCells()
        addNewsNavigationButton()

        
    }
    
    func registerCustomCells() {
        let nib = UINib(nibName: petsCellIdentifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: petsCellIdentifier)
    }
    
    func addNewsNavigationButton() {
        let addNavigationButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewsAction(sender:)))
        navigationItem.rightBarButtonItem = addNavigationButton
    }
    
    @objc func addNewsAction(sender: UIBarButtonItem) {
        if let newPetViewController = storyboard?.instantiateViewController(identifier: "NewPetViewController") as? NewPetViewController {
            newPetViewController.delegate = self
            navigationController?.pushViewController(newPetViewController, animated: true)
        }
        
    }
    
}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return province?.pet.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: petsCellIdentifier) as? PetsCell else {
            return UITableViewCell()
        }
        if let pets = province?.pet[indexPath.row] {
            cell.setupCell(pet: pets)
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let pets = province?.pet[indexPath.row], let lookViewController = storyboard?.instantiateViewController(identifier: "LookViewController") as? LookViewController  {
            lookViewController.pets = pets
        navigationController?.pushViewController(lookViewController, animated: true)
        
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            province?.pet.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
    

}

extension SecondViewController: AddNewPetProtocol {
    func addNew(pets: Pet) {
        if let province = province {
            realmManager.addNewsPet(pets: pets, province: province)
            navigationController?.popViewController(animated: true)
            tableView.reloadData()
        }
    }
}

