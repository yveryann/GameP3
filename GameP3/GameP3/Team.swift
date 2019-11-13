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
    // function for creating characters in the team
    func createMembers()  {
        print()
        print("Equipe \(name) :")
        // loop to create 3 characters
        for index in 1...3 {
            var input: String
            var choiceUserOne = Int()
            repeat {
               // display of characters and their specificity
                print("""
                    Choix personnage \(index) :")
                    1. Fighter:     ❤️ 50  🗡 10
                    2. Colossus:    ❤️ 90  🗡 5
                    3. Wizard:      ❤️ 80  🗡 50
                    4. Dwarf:       ❤️ 40   🗡 30
                    5. Magus:       ❤️ 30   💊 20
                    """)
                choiceUserOne = getIntFromUser()
            } // as long as the choice is not between 1 and 5
                while choiceUserOne != 1 && choiceUserOne != 2 && choiceUserOne != 3 && choiceUserOne != 4 && choiceUserOne != 5
            
            repeat {
                // choice of the unique name for the character
                print("Entrer un nom unique de votre personnage\(index):")
                input = getStringFromUser()
            } // as long as the uniqueness of the name is not verified
                while Character.isAlreadyExistingName(input)
            // save the character in the table with his unique name
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
            default: //
                print("Erreur je n'ai pas compris votre choix")
                break
            }
        }
    }
    
    func description() {
        // description of the team and characters with their number in the table
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
    
    func hasOnlyMagus() -> Bool {
        var numberOfMagus = 0
        for member in members {
            if member is Magus && !member.isDead() {
                numberOfMagus += 1
            }
        }
        if numberOfMagus == numberOfAliveCharacters() {
            return true
        }
        return false
    }
    
    private func numberOfAliveCharacters() -> Int {
        var count = 0
        for member in members {
            if !member.isDead() {
                count += 1
            }
        }
        return count
    }
    
}
