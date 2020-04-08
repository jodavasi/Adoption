//
//  PetsCell.swift
//  Adoption
//
//  Created by MAC on 4/7/20.
//  Copyright © 2020 jodavasi. All rights reserved.
//

import UIKit

class PetsCell: UITableViewCell {

    

    @IBOutlet weak var petImage: UIImageView!
    @IBOutlet weak var petName: UILabel!
    
    
    func setupCell(pet: Pet) {
        petName.text = pet.mote
        petImage.image = UIImage(named: pet.animalType)
        
        
        
    
    }
    

    
}
