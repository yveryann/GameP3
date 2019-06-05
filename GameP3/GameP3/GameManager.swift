//
//  GameManager.swift
//  GameP3
//
//  Created by Yann Yver on 22/05/2019.
//  Copyright © 2019 Yann Yver. All rights reserved.
//
class GameManager {
    
    var teams = [Team]()
    var player = [Character]()
    
    func getStringFromUser() -> String {
        let userChoice = readLine()
        if let choice = userChoice { //verify that the unpacking has succeeded: choice!=nil
            return choice
        } else { // unpacking has failed so choice=nil
            print("Erreur de saisie !")
            return ""
        }
    }
    
    func getIntFromUser() -> Int {
        if let userChoice = readLine() {
            return Int(userChoice)!
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
        
        for i in 1...2 {
            
            print("Entrer le nom de l'équipe \(i):")
            let input = getStringFromUser()
            
            let team = Team(teamName: input, players: player)
            teams.append(team)
            print(teams)
        }
        
        createPlayers()
    }
    
    
    func createPlayers() {
        
        for i in 1...3 {
            var choiceUserOne = Int()
            print("Entrer le nom de votre personnage\(i):")
            let input = getStringFromUser()
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
            let tempPlayer = Character(name: input, warriorType: warriorOne)
            player.append(tempPlayer)
        }
        print(player)
    }
    
}
