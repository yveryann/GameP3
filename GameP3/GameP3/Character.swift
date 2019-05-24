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
   
var player = Character(name: String(), warriorType: Warrior.Colossus)
    
    func addNamePlayer() {
        print("Entrer un nom de combattant:")
        player.name.append(getStringFromUser())
    }
    
    
    
    func createPlayers() {
        
        for i in 1...3 {
            
            addNamePlayer()
            repeat {
                print("Choix personnage 1 :")
                print("1. Fighter")
                print("2. Colossus")
                print("3. Magus")
                print("4. Dwarf")
                print("5. Wizard")
                choiceUserOne = getIntFromUser()
            } while choiceUserOne != 1 && choiceUserOne != 2 && choiceUserOne != 3 && choiceUserOne != 4 && choiceUserOne != 5
            
            var warriorOne: Warrior!
            switch choiceUserOne {
            case 1:
                warriorOne = .Fighter
            case 2:
                warriorOne = .Colossus
            case 3:
                warriorOne = .Magus
            case 4:
                warriorOne = .Dwarf
            case 5:
                warriorOne = .Wizard
            default:
                break
            }
            print("warriorOne")
        }
}
}

