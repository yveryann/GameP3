//
//  Dwarf.swift
//  GameP3
//
//  Created by Yann Yver on 21/09/2019.
//  Copyright © 2019 Yann Yver. All rights reserved.
//

class Dwarf: Character {
    init(name: String) {
        super.init(name: name, lifeStart: 40, life: 40)
        self.weapon = Chopped()
    }
}
