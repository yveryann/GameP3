//
//  Team.swift
//  GameP3
//
//  Created by Yann Yver on 22/05/2019.
//  Copyright © 2019 Yann Yver. All rights reserved.
//

class Team {
    var name: String
    var members = [Character]()
    
    
    init(name: String, members: [Character]) {
        self.name = name
        self.members = members
    }
    
    func createMembers()  { //add a virtual line teamIndex = 0
        print()
        print("Equipe \(name) :")
        for index in 1...3 {
            var input: String
            var choiceUserOne = Int()
            repeat {
                print("""
                    Choix personnage \(index) :")
                    1. Fighter:     ❤️ 30  🗡 10
                    2. Colossus:    ❤️ 75  🗡 5
                    3. Wizard:      ❤️ 50  🗡 50
                    4. Dwarf:       ❤️ 20   🗡 30
                    5. Magus:       ❤️ 35   💊 20
                    """)
                choiceUserOne = getIntFromUser()
            } while choiceUserOne != 1 && choiceUserOne != 2 && choiceUserOne != 3 && choiceUserOne != 4 && choiceUserOne != 5
            
            repeat {
                print("Entrer un nom unique de votre personnage\(index):")
                input = getStringFromUser()
            } while Character.isAlreadyExistingName(input)
            
            var warrior: Character
            switch choiceUserOne {
            case 1:
                warrior = Fighter(name: input)
                self.members.append(warrior)
            case 2:
                warrior = Colossus(name: input)
                self.members.append(warrior)
            case 3:
                warrior = Wizard(name: input)
                self.members.append(warrior)
            case 4:
                warrior = Dwarf(name: input)
                self.members.append(warrior)
            case 5:
                warrior = Magus(name: input)
                self.members.append(warrior)
            default:
                print("Erreur je n'ai pas compris votre choix")
                break
            }
        }
    }
    
    func description() {
        print("\(self.name) voici les personnages de votre équipe: ")
        for (index,character) in members.enumerated() {
            print("\(index + 1) - \(character.describe())")
        }
    }
    
    func selectCharacter() -> Character {
        print("Selectionner un personnage vivant dans la liste suivante: ")
        description()
        let choice = getIntFromUser() - 1
        if choice >= 0 && choice <= members.count {
            if !members[choice].isDead() {
                return members[choice]
            }else {
                print("Ce personnage est mort")
            }
        }
        print("Erreur, selectionner un chiffre de 1 à \(members.count) vivant")
        return selectCharacter()
    }
    
    func isTeamAlive() -> Bool {
        for character in members {
            if !character.isDead() {
                return true
            }
        }
        return false
    }
    
}
