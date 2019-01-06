//
//  PokedexCell.swift
//  pokedex-go
//
//  Created by Miguel Santos on 02/01/2019.
//  Copyright © 2019 Miguel Santos. All rights reserved.
//

import UIKit

class PokedexCell: UICollectionViewCell {
    
    @IBOutlet weak var pokemonImage: UIImageView!
    
    func configure(img:String){
        pokemonImage.image = UIImage(named: img)
    }
}
