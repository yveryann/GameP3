//
//  GameManager.swift
//  GameP3
//
//  Created by Yann Yver on 22/05/2019.
//  Copyright © 2019 Yann Yver. All rights reserved.
//
var teams = Team(teamName: [String](), players: [Character]())

var choiceUserOne = 0
var choiceUserTwo = 0

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
createTeams()
}

func createTeams() {
    
    for i in 0...1 {
    print("Entrer le nom de l'équipe \(i):")
    teams.teamName.append(getStringFromUser())
    }

//print name team for verification operation compilation
    print(teams.teamName)
    createPlayersCharacters()
}

func createPlayersCharacters() {
    print("Equipe \(teams.teamName[0]):")
        createPlayers()
        teams.players.append(player)
    print(teams)
    
    print()
    
    print("Equipe \(teams.teamName[1]):")
        createPlayers()
        teams.players.append(player)
    print(teams)
}





