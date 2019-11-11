//
//  Character.swift
//  GameP3
//
//  Created by Yann Yver on 22/05/2019.
//  Copyright © 2019 Yann Yver. All rights reserved.
//

class Character {
    var name: String
    var statsOfFights = 0
    var numberDamage = 0
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
    
    func attack(_ target: Character) {
        target.life -= self.weapon.damage // we remove the number of damage according to the characteristics of the attacker's weapon at the target
        statsOfFights += 1 // use the statsOfFight variable to calculate the number of fights performed
        numberDamage +=  self.weapon.damage // use the numberDamage variable to calculate the number of damage received
    }
    
    static func isAlreadyExistingName(_ name: String) -> Bool { // condition to check if the name is unreliable
        if Character.names.contains(name.lowercased()){
            print("Erreur, ce nom est déjà utilisé !")
            return true
        }
        Character.names.append(name.lowercased())
        return false
    }
    
    func isDead() -> Bool { // condition to check if the character is dead
        if life <= 0 {
            return true
        }
        return false
        }
    
    func describe() -> String { // description of the characteristics of the character with information if he is dead
        let dead = isDead() ? "- Mort" : "" // ternary condition to see if the character is dead
        return "🥋:\(self.name) - ❤️\(self.life) - 🗡\(self.weapon.damage) \(dead)"
              }
    
    func stats() -> String {
        return """
        Le personnage \(name):
        - \(describe())
        - \(statsOfFights) combats.
        - \(numberDamage) dégâts infligés.
        - \(life - lifeStart) pts de vie.
        """
    }
}
