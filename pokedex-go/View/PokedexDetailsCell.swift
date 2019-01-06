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
    @IBOutlet weak var pokemonNumber: UILabel!
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonWeight: UILabel!
    @IBOutlet weak var pokemonHeight: UILabel!
    @IBOutlet weak var pokemonType: UILabel!
    @IBOutlet weak var pokemonDescription: UILabel!
    @IBOutlet weak var pokemonEvolutionImage1: UIImageView!
    @IBOutlet weak var pokemonEvolutionImage2: UIImageView!
    @IBOutlet weak var pokemonEvolutionImage3: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.sizeToFit()
    }
    
    func configure(id:String, name: String, type1: String, type2: String){
        pokemonImage.image = UIImage(named: "pokemon_icon_" + id + "_00")
        pokemonEvolutionImage1.image = UIImage(named: "pokemon_icon_" + id + "_00")
        pokemonEvolutionImage2.image = UIImage(named: "pokemon_icon_" + id + "_00")
        pokemonEvolutionImage3.image = UIImage(named: "pokemon_icon_" + id + "_00")
        
        pokemonNumber.text = id
        pokemonName.text = name
        pokemonType.text = "\(type1)"
        if type2 != "" {
           pokemonType.text = "\(type1) / \(type2)"
        }
    }
}
