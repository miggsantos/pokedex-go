//
//  Pokemon.swift
//  pokedex-go
//
//  Created by Miguel Santos on 02/01/2019.
//  Copyright © 2019 Miguel Santos. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

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
    private var _description: String!
    private var _weight: String!
    private var _height: String!
    
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
    
    var description: String {
        if _description == nil {
            return ""
        } else {
            return _description
        }
    }
    
    var weight: String {
        if _weight == nil {
            return ""
        } else {
            return _weight
        }
    }
    
    var height: String {
        if _height == nil {
            return ""
        } else {
            return _height
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
    
    func getPokemonDescription(pokemonId: String, completion: @escaping (((String)?) -> Void)) {
        
        //https://pokeapi.co/api/v2/pokemon-species/1/
        
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon-species/\(pokemonId)/") else {
            completion(nil)
            return
        }
        
        Alamofire.request(url,
                          method: .get)
            .validate()
            .responseJSON { response in
                guard response.result.isSuccess else {
                    print("Error while fetching species: \(String(describing: response.result.error))")
                        completion(nil)
                    return
                }
       
                if((response.result.value) != nil) {
                    let json = JSON(response.result.value!)

                    for (_, object) in json["flavor_text_entries"]  {

                        if let language = object["language"]["name"].string {
                            if language == "en" {
                                self._description = object["flavor_text"].string
                                break
                            }
                        }
                        
                    }

                }

                completion(self.description)
        }
    }
    
    func getPokemonDetails(pokemonId: String, completion: @escaping (((Bool)?) -> Void)) {
        
        //https://pokeapi.co/api/v2/pokemon-species/1/
        
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(pokemonId)/") else {
            completion(nil)
            return
        }
        
        Alamofire.request(url,
                          method: .get,
                          parameters: ["include_docs": "true"])
            .validate()
            .responseJSON { response in
                guard response.result.isSuccess else {
                    print("Error while fetching species: \(String(describing: response.result.error))")
                    completion(nil)
                    return
                }
                
                if((response.result.value) != nil) {
                    let json = JSON(response.result.value!)
                    
                    if let weight = json["weight"].int {
                        self._weight = "\(weight)"
                    }
                    
                    if let height = json["height"].int {
                        self._height = "\(height)"
                    }
                    
                }
                
                completion(true)
        }
    }
    
}
