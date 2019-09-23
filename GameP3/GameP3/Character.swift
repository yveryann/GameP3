//
//  Character.swift
//  GameP3
//
//  Created by Yann Yver on 22/05/2019.
//  Copyright © 2019 Yann Yver. All rights reserved.
//

class Character {
    var name: String
    var lifeStart: Int
    var life: Int

    init(name: String, lifeStart: Int, life: Int) {
        self.name = name
        self.lifeStart = lifeStart
        self.life = life
    }
    }
    
    // all characters can receive damage
    func receiveDamage(weaponDamage: Int) {
        self.life -= weaponDamage
        if self.life < 0 {
            self.life = 0
        }
    }
    
    // all characters can receive care
    func receiveCare(life: Int) {
        self.life += Magus.careDamage
        if self.life > self.lifeStart {
            self.life = self.lifeStart
        }
    }
    // all characters, execpt the magus, can attack
    func attack(characterCible: Character) {
        characterCible.receiveDamage(damage: self.weapon!.damage)
    }
    
    // only the Magus can provide care
    // remove from this class
    


