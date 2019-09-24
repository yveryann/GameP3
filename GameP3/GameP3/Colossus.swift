//
//  Colossus.swift
//  GameP3
//
//  Created by Yann Yver on 21/09/2019.
//  Copyright © 2019 Yann Yver. All rights reserved.
//

class Colossus: Character {
    
    init(name: String) {
        super.init(name: name, lifeStart: 400, life: 400)
        self.weapon = FlameThrower()
    }
}
