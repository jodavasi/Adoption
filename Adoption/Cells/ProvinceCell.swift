//
//  ProvinceCell.swift
//  Adoption
//
//  Created by MAC on 4/7/20.
//  Copyright © 2020 jodavasi. All rights reserved.
//

import UIKit




class ProvinceCell: UITableViewCell {
    
    @IBOutlet weak var provinceName: UILabel!
    
    @IBOutlet weak var imgProvince: UIImageView!
    
    
    func setupCell(province: Province) {
        provinceName.text = province.name
        imgProvince.image = UIImage(named: province.imageProvince)
        
        
    
    }
    
}
