//
//  PokedexDetailsCell.swift
//  pokedex-go
//
//  Created by Miguel Santos on 03/01/2019.
//  Copyright © 2019 Miguel Santos. All rights reserved.
//

import UIKit

class PokedexDetailsCell: UICollectionViewCell {
    
    @IBOutlet weak var pokemonImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.sizeToFit()
    }
    
    func configure(id:String){
        pokemonImage.image = UIImage(named: "pokemon_icon_" + id + "_00")
    }
}
