//
//  Pokemon.swift
//  pokedex-go
//
//  Created by Miguel Santos on 02/01/2019.
//  Copyright © 2019 Miguel Santos. All rights reserved.
//

import Foundation

class Pokemon {
    private var _id: Int!
    private var _name: String
    private var _type1: String
    private var _type2: String
    private var _generation: String
    private var _evo1: String
    private var _evo2: String
    private var _evo3: String
    private var _evo4: String
    
    var name: String{
        return _name
    }
    
    var id: Int{
        return _id
    }
    
    var id_img_url: String{
        return getPokemonImg(pokemonId: _id)
    }
    
    var type1: String{
        return _type1
    }
    
    var type2: String{
        return _type2
    }
    
    var generation: String{
        return _generation
    }
    
    var evo1: String {
        return _evo1
    }
    
    var evo1_img_url: String{
        if _evo1 == ""{
            return ""
        } else {
            return getPokemonImg(pokemonId: Int(_evo1)!)
        }
    }
    
    var evo2: String {
        return _evo2
    }
    
    var evo2_img_url: String{
        if _evo2 == ""{
            return ""
        } else {
            return getPokemonImg(pokemonId: Int(_evo2)!)
        }
    }
    
    var evo3: String {
        return _evo3
    }
    
    var evo3_img_url: String{
        if _evo3 == ""{
            return ""
        } else {
            return getPokemonImg(pokemonId: Int(_evo3)!)
        }
    }
    
    var evo4: String {
        return _evo4
    }
    
    var evo4_img_url: String{
        if _evo4 == ""{
            return ""
        } else {
            return getPokemonImg(pokemonId: Int(_evo4)!)
        }
    }
    
    
    init(id: Int, name: String, type1: String, type2: String, generation:String, evo1: String, evo2: String, evo3: String, evo4: String) {
        self._id = id
        self._name = name
        self._type1 = type1
        self._type2 = type2
        self._generation = generation
        self._evo1 = evo1
        self._evo2 = evo2
        self._evo3 = evo3
        self._evo4 = evo4
    }
    
    
    func getPokemonImg(pokemonId: Int) -> String {
        var strPokeId = ""
        if pokemonId == 0 {
            return ""
        }
        else if pokemonId < 10 {
            strPokeId = "00\(pokemonId)"
        }
        else if pokemonId < 100 {
            strPokeId = "0\(pokemonId)"
        } else {
            strPokeId = "\(pokemonId)"
        }
        
        return "pokemon_icon_" + strPokeId + "_00"
        
    }

}


