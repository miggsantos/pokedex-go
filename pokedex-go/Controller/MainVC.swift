//
//  MainVC.swift
//  pokedex-go
//
//  Created by Miguel Santos on 02/01/2019.
//  Copyright © 2019 Miguel Santos. All rights reserved.
//

import UIKit

var PokemonList=[Pokemon]()

class MainVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //fillArray()
        parsePokemonCSV()
        
    }

    func parsePokemonCSV(){
        
        let path = Bundle.main.path(forResource: "pokemons", ofType: "csv")!
        do{
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            
            for row in rows{
                
                //let pokeId = Int(row["id"]!)!
                //let pokeId = row["id"]!
                var pokeId = ""
            
                let count = Int(row["id"]!)!
                if count < 10 {
                    pokeId = "00\(count)"
                }
                else if count < 100 {
                    pokeId = "0\(count)"
                    
                } else {
                    pokeId = "\(count)"
                }
                
                let name = row["name"]!
                let type1 = row["type1"]!
                let type2 = row["type2"]!
                let gen = row["gen"]!
                let poke = Pokemon(id: pokeId, name: name, type1: type1, type2: type2, generation: gen)
                PokemonList.append(poke)
            }
            
            //print(rows)
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    /*
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
     */
}

