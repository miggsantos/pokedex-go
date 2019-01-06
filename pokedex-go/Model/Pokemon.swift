//
//  Pokemon.swift
//  pokedex-go
//
//  Created by Miguel Santos on 02/01/2019.
//  Copyright © 2019 Miguel Santos. All rights reserved.
//

import Foundation

class Pokemon {
    private var _id: String
    private var _name: String
    private var _type1: String
    private var _type2: String
    private var _generation: String
    
    var name: String{
        return _name
    }
    
    var id: String{
        return _id
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
    
    init(id: String, name: String, type1: String, type2: String, generation:String) {
        self._id = id
        self._name = name
        self._type1 = type1
        self._type2 = type2
        self._generation = generation
    }
}


