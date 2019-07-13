//
//  GameManager.swift
//  GameP3
//
//  Created by Yann Yver on 22/05/2019.
//  Copyright © 2019 Yann Yver. All rights reserved.
//
class GameManager {
    
    var teams = [Team]()
    // Delete array and use array of Team
    
    
    func getStringFromUser() -> String {
        let userChoice = readLine()
        if let choice = userChoice { //verify that the unpacking has succeeded: choice!=nil
            return choice
        } else { // unpacking has failed so choice=nil  - Function does not display the error and crash the program
            print("Erreur de saisie !")
            return ""
        }
    }
    
    func getIntFromUser() -> Int {
        if let userChoice = readLine() {
            if let i = Int(userChoice) {
                return i
            } else {
                print("Erreur de saisie")
                return 0
            }
        } else {   //Function does not display the error and crash the program
            print("Erreur de saisie")
            return 0
        }
    }
    
    func rules() {
        print("""
        Bienvenue sur GameP3
""")
        print()
        print("""
        GameP3 est un jeu de combat entre 2 équipes de 3 personnages.
        Vous aurez le choix du tour pour attaquer ou vous soigner.
        Choisissez un combattant et un adversaire.
        Un coffre mystère vous permettra de modifier l'arme de votre combattant.
        L'équipe ayant encore un combattant en vie sera déclaré gagnante.
        Alors n'attendons plus, au combat soldat !!
""")
        print()
        print()
        createTeamName()
    }
    
    func createTeamName() {
        var choosenNames = [String]()
        for i in 1...2 {
            var input : String
            repeat {
                print("Entrer un nom unique pour l'équipe \(i):")
                input = getStringFromUser()
            } while choosenNames.contains(input)
            choosenNames.append(input)
            let team = Team(teamName: input, players: [Character]())
            teams.append(team)
            
        }
        print()
        createPlayers(teamIndex: 0)
        print()
        print("\n   Félicitation l'équipe: \(teams[0].teamName) est crée.\n")
        print("Les personnages sont: \(teams[0].players[0].name)")
        print()
        //print(" \(players[0].name): \(players[0].warriorType) arme: \(players[0].weapon) niveau de vie: \(players[0].life) \n \(players[1].name): \(players[1].warriorType) arme: \(players[1].weapon) niveau de vie: \(players[1].life) \n \(players[2].name): \(players[2].warriorType) arme: \(players[2].weapon) niveau de vie: \(players[2].life)")
        
        createPlayers(teamIndex: 1)
        print()
        print("\n   Félicitation l'équipe: \(teams[1].teamName) est crée.\n")
        print("Les personnages sont:\(teams[1].players[1].name)")
        print()
        // print(" \(players[3].name): \(players[3].warriorType) arme: \(players[3].weapon) niveau de vie: \(players[3].life) \n \(players[4].name):  \(players[4].warriorType) arme: \(players[4].weapon) niveau de vie: \(players[4].life) \n \(players[5].name):  \(players[5].warriorType) arme: \(players[5].weapon) niveau de vie: \(players[5].life)")
        
    }
    
    
    func createPlayers(teamIndex: Int) {
        //ajouter ligne virtuel teamIndex=0
        var choosenName = [String]()
        var arrayOfCharacter = [Character]() //create array of character var arrayOfCharacters = [Character]()
        for i in 1...3 {
            var input: String
            var choiceUserOne = Int()
            repeat {
                print("Entrer un nom unique de votre personnage\(i):")
                input = getStringFromUser()
            } while choosenName.contains(input)
            choosenName.append(input)
            repeat {
                print("Choix personnage \(i) :")
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
            let tempPlayers = Character(name: input, warriorType: warriorOne)
            arrayOfCharacter.append(tempPlayers) //add tempPlayers in arrayOfCharacters
            //teams[teamIndex].players.append(tempPlayers) //c'est une deuxième manière de faire sans passer par la ligne 124
            // soit on garde ligne 119 + 125 soit on utilise juste la ligne 120
            
        }
        teams[teamIndex].players = arrayOfCharacter
        //assign arrayOfCharacters to the team index teamIndex
        
    }
}
