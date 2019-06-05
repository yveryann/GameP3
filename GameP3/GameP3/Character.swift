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
    var life: Int
    
    
    
    init(name: String, warriorType: Warrior) {
        self.warriorType = warriorType
        self.name = name
        
        
        switch self.warriorType {
        case .Fighter:
            self.weapon = Sword()
            self.life = 100
            
        case .Colossus:
            self.weapon = FlameThrower()
            self.life = 400
            
        case .Dwarf:
            self.weapon = Chopped()
            self.life = 50
            
        case .Wizard:
            self.weapon = ShockWave()
            self.life = 200
            
        case .Magus:
            self.life = 70
        }
    }
   
}



