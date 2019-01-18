//
//  PokedexSectionCell.swift
//  pokedex-go
//
//  Created by Miguel Santos on 18/01/2019.
//  Copyright © 2019 Miguel Santos. All rights reserved.
//

import UIKit

class PokedexSectionCell: UICollectionViewCell {
    
    @IBOutlet weak var region_label: UILabel!
    
    func configuration(region: String) {
        region_label.sizeToFit()
        region_label.text = region
    }
}
