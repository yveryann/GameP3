//
//  GameManager.swift
//  GameP3
//
//  Created by Yann Yver on 22/05/2019.
//  Copyright © 2019 Yann Yver. All rights reserved.
//
class GameManager {
    
    var teams = [Team]()
    
    func getStringFromUser() -> String {
        let userChoice = readLine()
        if let choice = userChoice { //verify that the unpacking has succeeded: choice!=nil
            return choice
        } else { // unwrapping has failed so choice=nil  - Function does not display the error and crash the program
            print("Erreur de saisie !")
            return ""
        }
    }
    
    func getIntFromUser() -> Int {
        if let userChoice = readLine() { // unwrapping securely the optional readLine
            if let intFromUser = Int(userChoice) { // unwrapping securely the optional intFromUser
                return intFromUser
            } else {
                print("Erreur de saisie")
                return 0
            }
        } else {
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
        print("Equipe \(teams[0].teamName):")
        createPlayers(teamIndex: 0)
        print()
        print("Equipe \(teams[1].teamName):")
        createPlayers(teamIndex: 1)
        print()
        descriptionOfTeams()
        print()
        // ajouter function fight creer boucle pour les combats
        // ajout function choix utilisateur combats ou soins
        // mettre les fonctions dans la classe correspondante
    }
    
    
    func createPlayers(teamIndex: Int)  { //add a virtual line teamIndex = 0
        var choosenName = [String]()
        var arrayOfCharacter = [Character]() //create array of character
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
            //teams[teamIndex].players.append(tempPlayers) - it's a second way to go without going through line 122
            // either we keep line 122 + 127 or we just use line 123
            
        }
        teams[teamIndex].players = arrayOfCharacter
        //assign arrayOfCharacters to the team index teamIndex
        
    }
    
    func descriptionOfTeams() {
        for i in 0..<teams.count {
            print("L'équipe \(teams[i].teamName) est composé de:")
            print()
            for b in 0..<teams[i].players.count {
                print("Personnage\(b+1): \(teams[i].players[b].name) \nType de personnage: \(teams[i].players[b].warriorType)")
                // condition if warriorType different du magus alors afficher nameOfWeapon
                if teams[i].players[b].warriorType != Warrior.Magus {
                    print("Arme: \(teams[i].players[b].weapon!.nameOfWeapon!)") //attention au pts d'exclamation
                } else { print("Arme: Le Mage n'a pas d'arme et ne prodigue que des soins")
                }
                print("Pts de vie: \(teams[i].players[b].life)")
                print()
            }
        }
    }
}
