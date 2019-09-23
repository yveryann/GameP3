//
//  Magus.swift
//  GameP3
//
//  Created by Yann Yver on 21/09/2019.
//  Copyright © 2019 Yann Yver. All rights reserved.
//

class Magus: Character {
    var careDamage = 30
 
 init() {
     super.init(name: String, lifeStart: 70, life: 70)
 }

// only the Magus can provide care
func care(characterCible: Character) {
    characterCible.receiveCare(life: self.life)
}
