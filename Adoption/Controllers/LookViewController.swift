//
//  LookViewController.swift
//  Adoption
//
//  Created by MAC on 4/8/20.
//  Copyright © 2020 jodavasi. All rights reserved.
//

import UIKit


protocol LookPetProtocol : class {
    func addNew(pets:Pet)
}

class LookViewController: UITableViewController {

    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var imagePets: UIImageView!
    
    @IBOutlet weak var ownerLbl: UILabel!
    
    @IBOutlet weak var phoneLbl: UILabel!
    
    @IBOutlet weak var typeLbl: UILabel!
    
    
    var pets: Pet?
    
    
    
    
    weak var delegate: LookPetProtocol?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePets.image = UIImage(named:pets!.animalType)
        ownerLbl.text = pets!.ownerName
        nameLbl.text = pets!.mote
        phoneLbl.text = pets!.phoneNumber
        typeLbl.text = pets!.animalType
        
        
        

        
    }


}
