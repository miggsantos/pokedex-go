//
//  MainVC.swift
//  pokedex-go
//
//  Created by Miguel Santos on 02/01/2019.
//  Copyright © 2019 Miguel Santos. All rights reserved.
//

import UIKit

var PokemonList=[String]()

class MainVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillArray()
    }

    func fillArray() {
        var count = 1
        while count < MAX_POKEMON_NUMBER + 1 {
            var number : String
            if count < 10 {
                number = "00\(count)"
            }
            else if count < 100 {
                number = "0\(count)"
                
            } else {
                number = "\(count)"
            }
            
            
            PokemonList.append(number)
            count+=1
        }
        

    }
}

