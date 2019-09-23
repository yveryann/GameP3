//
//  GameManager.swift
//  GameP3
//
//  Created by Yann Yver on 22/05/2019.
//  Copyright © 2019 Yann Yver. All rights reserved.
//
class GameManager {
    
    var teams = [Team]()
    
    
    func rules() {
        print("""
        Bienvenue sur GameP3
""")
        print()
        print("""
        GameP3 est un jeu de combat entre 2 équipes de 3 personnages.
        
        Vous aurez le choix à chaque tour pour attaquer (avec un combattant)
        ou de vous soigner (seul le Mage détient ce pouvoir).
        
        Choisissez un combattant et un adversaire.
        Un coffre mystère vous permettra de modifier l'arme de votre combattant.
        L'équipe ayant encore un combattant en vie sera déclaré vainqueur.
        Alors n'attendons plus, au combat soldat !!


""")
        createTeamName()
    }
    
    func createTeamName() {
        var choosenNames = [String]()
        repeat  {
            var input : String
            repeat {
                print("Entrer un nom unique pour l'équipe \(teams.count + 1):")
                input = getStringFromUser()
            } while choosenNames.contains(input)
            choosenNames.append(input)
            let team = Team(teamName: input, players: [Character]())
            teams.append(team)
            
        } while teams.count < 2
        
        print()
        print("Equipe \(teams[0].teamName):")
        createPlayers(teamIndex: 0)
        print()
        print("Equipe \(teams[1].teamName):")
        createPlayers(teamIndex: 1)
        print()
        descriptionOfTeams()
        print()
        
        chooseFighter()//link to the next instrcution to execute
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
            //teams[teamIndex].players.append(tempPlayers) - it's a second way to go without going through line 121
            // either we keep line 117 + 121 or we just use line 118
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
                // if condition warriorType different from magus then display nameOfWeapon
                if teams[i].players[b].warriorType != Warrior.Magus {
                    print("Arme: \(teams[i].players[b].weapon!.nameOfWeapon!)") //unwrapping force because in the condition I specified that the mage had no weapon and therefore return a special sentence
                } else { print("Arme: Le Mage n'a pas d'arme et ne prodigue que des soins")
                }
                print("Pts de vie: \(teams[i].players[b].life)")
                print()
            }
        }
    }
    
    func chooseFighter() {
        // appraisal test add loop
        var firstActionChosen: Int
        var opponent: Int
        var playerToHeal: Int
        
        
        // The user chooses an attacker
        repeat {
            print("Equipe:\(teams[0].teamName)")
            print("Choisissez votre combattant:")
            print("1. \(teams[0].players[0].name), Type joueur:\(teams[0].players[0].warriorType)")
            print("2. \(teams[0].players[1].name), Type joueur:\(teams[0].players[1].warriorType)")
            print("3. \(teams[0].players[2].name), Type joueur:\(teams[0].players[2].warriorType)")
            firstActionChosen = getIntFromUser()
        } while firstActionChosen != 1 && firstActionChosen != 2 && firstActionChosen != 3
        
       //rajouter condition choix attaque ou soin
            if teams[0].players[firstActionChosen].warriorType != .Magus  {
            repeat {
            print("Equipe:\(teams[0].teamName)")
            print("Choisissez votre adversaire:")
            print("1. \(teams[1].players[0].name), Type joueur:\(teams[1].players[0].warriorType)")
            print("2. \(teams[1].players[1].name), Type joueur:\(teams[1].players[1].warriorType)")
            print("3. \(teams[1].players[2].name), Type joueur:\(teams[1].players[2].warriorType)")
            opponent = getIntFromUser()
        } while opponent != 1 && opponent != 2 && opponent != 3
    // appeler instruction d'attaque
            teams[0].players[firstActionChosen].attack(characterCible: teams[1].players[opponent])
    
        // sinon (si utilisateur a choisi mage) alors
            } else {
        repeat {
            print("Equipe:\(teams[0].teamName)")
            print("Choisissez le combattant à soigner:")
            print("1. \(teams[0].players[0]), Type joueur:\(teams[0].players[0].warriorType)")
            print("2. \(teams[0].players[1]), Type joueur:\(teams[0].players[1].warriorType)")
            print("3. \(teams[0].players[2]), Type joueur:\(teams[0].players[2].warriorType)")
            playerToHeal = getIntFromUser()
        } while playerToHeal != 1 && playerToHeal != 2 && playerToHeal != 3
        // appeler instruction soin
        teams[0].players[firstActionChosen].care(characterCible: teams[0].players[playerToHeal])
        }
    }
    

/*
 Résumé de la suite du jeu:
 Summary of the continuation of the game:
 
 Interdire les équipes à choisir 3 Mage (ajouter à la fin)
 Prohibit teams from choosing 3 Magus (add at the end)
 
 Combattant attaquant et déduire l'action en fonction du choix de l'attaquant
 
 Demander à l'équipe0 quelle action elle souhaite réaliser (attaque ou soin - verifier si Mage dans l'équipe sinon ne pas proposer choix attaque) si choix = attaque ne pas donner la possibilité de choisir Mage.
 Ask the team what action they want to take (attack or care - check if Mage in the team otherwise do not propose choice attack) if choice = attack do not give the opportunity to choose Mage.
 
 Si attaque:
 If attack:
 choix du warriorType de l'équipe attaquante
 choice of the attacking team's warriorType
 choix du warriortype de l'équipe attaquée
 choice of the warriortype of the attacked team
 recuperer le nbre de pts de l'arme de l'attaquant et l'enlever ses pts aux pts de vie du warriorType de l'équipe attaquée
 recover the number of pts from the attacker's army and remove his pts from the attacked team's warriorType
 
 si soin:
 if care:
 choix du warriorType à soigner
 choice of warriorType to treat
 ajouter pts de soins aux warriorType à soigner sans pouvoir dépasser les pts de vie attribué en début de partie
 add pts of care to warriorType to cure without being able to exceed the points of life allotted at the beginning of the game
 Creer une boucle pour que les tours s'enchainent en alternant les équipes
 Create a loop so that the turns are linked by alternating teams
 Faire un petit résumé avec pts de vie restant après chaque combat et le nom du combattant
 Make a small summary with pts of life remaining after each fight and the name of the fighter
 Le vainqueur de la partie est l'équipe qui posséde encore un joueur avec des pts de vie
 The winner of the game is the team that still has a player with life points
 */

// write the functions in the classes concerned

/*
 Func attack in class character
 Func treat in class character
 Func summary in class gamemanager
 */
}
