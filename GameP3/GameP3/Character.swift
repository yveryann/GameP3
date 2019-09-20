//
//  Character.swift
//  GameP3
//
//  Created by Yann Yver on 22/05/2019.
//  Copyright © 2019 Yann Yver. All rights reserved.
//

class Character {
    var name: String
    var warriorType: Warrior
    var weapon: Weapon?
    var lifeStart: Int
    var life: Int
    let mageDamage = 30
    
    init(name: String, warriorType: Warrior) {
        self.warriorType = warriorType
        self.name = name
        
        switch self.warriorType {
        case .Fighter:
            self.weapon = Sword()
            self.lifeStart = 100
            self.life = 100
            
        case .Colossus:
            self.weapon = FlameThrower()
            self.lifeStart = 400
            self.life = 400
            
        case .Dwarf:
            self.weapon = Chopped()
            self.lifeStart = 80
            self.life = 80
            
        case .Wizard:
            self.weapon = ShockWave()
            self.lifeStart = 200
            self.life = 200
            
        case .Magus:
            self.lifeStart = 70
            self.life = 70
        }
    }
    
    func receiveDamage(damage: Int){
        self.life -= damage
        if self.life < 0 {
            self.life = 0
        }
    }
    
    func receiveCare(life: Int){
        self.life += mageDamage
        if self.life > self.lifeStart {
            self.life = self.lifeStart
        }
    }
    
    func attack(characterCible: Character) {
        characterCible.receiveDamage(damage: self.weapon!.damage)
    }
    
    func care(characterCible: Character) {
        characterCible.receiveCare(life: self.life)
    }
    
    
}


