//
//  main.swift
//  GameP3
//
//  Created by Yann Yver on 22/05/2019.
//  Copyright © 2019 Yann Yver. All rights reserved.
//

let start = GameManager()

start.rules()

func getStringFromUser() -> String {
    let userChoice = readLine()
    if let choice = userChoice { //verify that the unwrapping has succeeded: choice!=nil
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
