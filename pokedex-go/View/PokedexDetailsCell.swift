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
    @IBOutlet weak var arrowImage1: UIImageView!
    @IBOutlet weak var arrowImage2: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.sizeToFit()
    }
    
    func configure(pokemon:Pokemon){
        pokemonImage.image = UIImage(named: pokemon.id_img_url)

        pokemonNumber.text = "\(pokemon.id)"
        pokemonName.text = pokemon.name
        pokemonType.text = "\(pokemon.type1)"
        if pokemon.type2 != "" {
           pokemonType.text = "\(pokemon.type1) / \(pokemon.type2)"
        }
        
        // Evolution
        
        pokemonEvolutionImage1.isHidden = false
        pokemonEvolutionImage2.isHidden = false
        pokemonEvolutionImage3.isHidden = false
        arrowImage1.isHidden = false
        arrowImage2.isHidden = false
        
        if pokemon.evo1_img_url == "" {
            pokemonEvolutionImage1.image = UIImage(named: pokemon.id_img_url)
            arrowImage1.isHidden = true
            pokemonEvolutionImage2.isHidden = true
            arrowImage2.isHidden = true
            pokemonEvolutionImage3.isHidden = true

            return
        } else {
            pokemonEvolutionImage1.image = UIImage(named: pokemon.evo1_img_url)
        }
        
        if pokemon.evo2_img_url == "" {
            arrowImage1.isHidden = true
            arrowImage2.isHidden = true
            pokemonEvolutionImage2.isHidden = true
            pokemonEvolutionImage3.isHidden = true
            return
        } else {
            pokemonEvolutionImage2.image = UIImage(named: pokemon.evo2_img_url)
        }
        
        if pokemon.evo3_img_url == "" {
            arrowImage2.isHidden = true
            pokemonEvolutionImage3.isHidden = true
        } else {
            
            pokemonEvolutionImage3.image = UIImage(named: pokemon.evo3_img_url)
        }
        
        
    }
}
