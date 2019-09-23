//
//  Weapon.swift
//  GameP3
//
//  Created by Yann Yver on 23/09/2019.
//  Copyright © 2019 Yann Yver. All rights reserved.
//

class Weapon {
    var damage: Int
    var weaponName: String
    
    init(damage: Int, weaponName: String) {
        self.damage = damage
        self.weaponName = weaponName
    }
}
