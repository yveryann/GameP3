//
//  Fighter.swift
//  GameP3
//
//  Created by Yann Yver on 21/09/2019.
//  Copyright © 2019 Yann Yver. All rights reserved.
//

class Fighter: Character {
    var weapon = Sword()
    
    init() {
        super.init(name: String, lifeStart: 100, life: 100)
    }
    
}
