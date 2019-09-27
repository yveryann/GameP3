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
    var life: Int{
        didSet {
            if life < 0 {
                life = 0
            } else if life > lifeStart {
                life = lifeStart
            }
        }
    }
    var weapon: Weapon = Sword()
    static var names = [String]()
    
    init(name: String, lifeStart: Int, life: Int) {
        self.name = name 
        self.lifeStart = lifeStart
        self.life = life
    }
    
    func attack(characterCible: Character) {
        characterCible.life -= self.weapon.damage
    }
    
    func addName() {
        if Character.names.contains(self.name.lowercased()){
                print("Erreur, ce nom est déjà utilisé !")
            }else{
                Character.names.append(self.name.lowercased())
            }
        }
    }
}



