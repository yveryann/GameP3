//
//  Dwarf.swift
//  GameP3
//
//  Created by Yann Yver on 21/09/2019.
//  Copyright © 2019 Yann Yver. All rights reserved.
//

class Dwarf: Character {
    var weapon = Chopped()
     
     init() {
         super.init(name: String, lifeStart: 80, life: 80)
     }
    
}
