//
//  MainVC.swift
//  pokedex-go
//
//  Created by Miguel Santos on 02/01/2019.
//  Copyright © 2019 Miguel Santos. All rights reserved.
//

import UIKit

var PokemonList=[Pokemon]()
var GenerationsCount = [Int:Int]()

class MainVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        parsePokemonCSV()
        
    }

    func parsePokemonCSV(){
        
        let path = Bundle.main.path(forResource: "pokemons", ofType: "csv")!
        do{
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            
            for row in rows{

                let pokeId = Int(row["id"]!)!
                let name = row["name"]!
                let type1 = row["type1"]!
                let type2 = row["type2"]!
                let evo1 = row["evo1"]!
                let evo2 = row["evo2"]!
                let evo3 = row["evo3"]!
                let evo4 = row["evo4"]!
                let gen = row["gen"]!
                let poke = Pokemon(id: pokeId, name: name, type1: type1, type2: type2, generation: gen, evo1: evo1, evo2: evo2, evo3: evo3, evo4: evo4)
                PokemonList.append(poke)
                
                GenerationsCount[Int(gen)!, default: 0] += 1
            }
            

            
            print (GenerationsCount)
            
            
            
            
            
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
  
}

