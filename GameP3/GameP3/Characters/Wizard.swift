//
//  Wizard.swift
//  GameP3
//
//  Created by Yann Yver on 21/09/2019.
//  Copyright © 2019 Yann Yver. All rights reserved.
//

class Wizard: Character {
    init(name: String) {
        super.init(name: name, lifeStart: 200, life: 200)
        self.weapon = ShockWave()
    }    
}
