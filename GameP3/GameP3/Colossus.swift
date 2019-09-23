//
//  Colossus.swift
//  GameP3
//
//  Created by Yann Yver on 21/09/2019.
//  Copyright © 2019 Yann Yver. All rights reserved.
//

class Colossus: Character {
    var weapon = FlameThrower()
     
     init() {
         super.init(name: String, lifeStart: 400, life: 400)
     }
    
}
