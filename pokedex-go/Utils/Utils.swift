//
//  Utils.swift
//  pokedex-go
//
//  Created by Miguel Santos on 18/01/2019.
//  Copyright © 2019 Miguel Santos. All rights reserved.
//

import Foundation

class Utils {
    
    static func getFirstIndexPokemonByRegion(region: Int) -> Int {
        
        if region == 2 {
            return GenerationsCount[1]!
        }  else if region == 3 {
            return GenerationsCount[1]! + GenerationsCount[2]!
        }  else if region == 4 {
            return GenerationsCount[1]! + GenerationsCount[2]! + GenerationsCount[3]!
        } else {
            return 0
        }

        
    
    }
}
