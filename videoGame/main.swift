class Main {
    
    var playerOne: Player?
    var playerTwo: Player?
    
// Ask name to the players and check if names are valid.
    func createPlayer() -> Player {
        if let name = readLine(), isValid(name: name) {
            return Player(name: name)
        }else {
            print("Incorect name, please enter a valid name !")
            return createPlayer()
        }
    }

// Launch the game and create players alternately.
    func createPlayers() {
        print("Hello !"
        + "\nPlayer One enter your name:")
        playerOne = createPlayer()
        print("Player Two enter your name: ")
        playerTwo = createPlayer()
    }
    
    
// Display characters's details.
    func displayCharacters() {
        print("Characters : "
            + "\n"
            + "\nFighter \(Fighter.defaultIcon): The classic attacker, a good warrior !"
            + "\nLife Points: \(Fighter.defaultLifepoint) // Weapon: \(Fighter.defaultWeapon.name) \(Fighter.defaultWeapon.icon)"
            + "\n"
            + "\nMage \(Mage.defaultIcon): His talent ? Heal the members of his team. "
            + "\nLife Points: \(Mage.defaultLifepoint) // Weapon: \(Mage.defaultWeapon.name) \(Mage.defaultWeapon.icon)"
            + "\n"
            + "\nColossus \(Colossus.defaultIcon): Imposing and very resistant, but it will not hurt you badly."
            + "\nLife Points: \(Colossus.defaultLifepoint) // Weapon: \(Colossus.defaultWeapon.name) \(Colossus.defaultWeapon.icon)"
            + "\n"
            + "\nDwarf \(Dwarf.defaultIcon): His ax will deal you a lot of damage, but he does not have a lot of health."
            + "\nLife Points: \(Dwarf.defaultLifepoint) // Weapon: \(Dwarf.defaultWeapon.name) \(Dwarf.defaultWeapon.icon)"
            + "\n")
        
    }
    

// Allows players to choose their characters and name them.
    func chooseCharacters() -> Character  {
        print("\n1. Fighter"
            + "\n2. Mage"
            + "\n3. Colossus"
            + "\n4. Dwarf")
            
        
        if let choice = readLine() {
            switch choice {
            case"1":
                return Fighter(fighterName: nameCharacter())
            case"2":
                return Mage(mageName: nameCharacter())
            case"3":
                return Colossus(colossusName: nameCharacter())
            case"4":
                return Dwarf(dwarfName: nameCharacter())
            default:
                print("Incorect choice. Please choose a character: ")
                return chooseCharacters()
            }
            
        }
        return chooseCharacters()
    }
    
    
// Get characters's names given by the user. Also checks if names are valid. The method is called in chooseCharacters().
    func nameCharacter() -> String {
        print("Please name your character: ")
        if let name = readLine(), isValid(name: name) {
            return name
        }else {
            print("Incorect name, please enter a valid name !")
            return nameCharacter()
        }
    }
    
// Method to check if the name is not empty and if the names given by the user doesn't already exist.
    func isValid(name: String) -> Bool {
        var nameList = getNames(player: playerOne)
        nameList.append(contentsOf: getNames(player: playerTwo))
        
        return !name.isEmpty && !nameList.contains(name)
    }
    
// Gets names and add them in nameList.
    func getNames(player: Player?) -> [String] {
        var nameList = [String]()
        
        if let p = player {
            nameList.append(p.name)
            for character in p.team {
                nameList.append(character.name)
            }
        }
        return nameList
    }

// Loop allowing each player to choose and name characters alternately.
    func populateTeam() {
        for i in 0...2 {
            print("Player one choose a character: ")
            playerOne?.team.append(main.chooseCharacters())
            print("Player two choose a character: ")
            playerTwo?.team.append(main.chooseCharacters())
        }
        
    }

// Displays name of each player, also display details of each character in team.
    func playerTeam(player: Player?) {
        print("\n"
            + "\n\(player!.name) ! Your team is composed by the following characters :")
        for characters in player!.team {
            print("\(characters.icon) \(characters.name)"
                + "\nLife Point: \(characters.lifePoint)"
                + "\nWeapon: \(characters.weapon.name) \(characters.weapon.icon) ")
        }
    }
    
    func displayTeam() {
        playerTeam(player: playerOne)
        playerTeam(player: playerTwo)
    }
 
    
    func selectCharacter(player: Player) -> Character {
        for (index, character) in player.team.enumerated() {
            if character.isAlive() {
              print(index, ":", character.icon + " " + character.name)
            }
        }
        
        if let characterIndex = readLine() {
            if let index = Int(characterIndex), player.team.indices.contains(index) {
              let character = player.team[index]
                if character.isAlive() {
                    print("You selected \(character.name)")
                    return character
                    
                }else {
                    print("This character is dead, choose an other one: ")
                    return selectCharacter(player: player)
                }
                
            
            }else {
                print("Incorect choice, please select a character: ")
                return selectCharacter(player: player)
            }
            
            
        }
        return selectCharacter(player: player)
    }

    

}

//Main's instance
let main = Main()
main.createPlayers()
main.displayCharacters()
main.populateTeam()
main.displayTeam()



while main.playerOne!.hasACharacterAlive() && main.playerTwo!.hasACharacterAlive() {
    print("\(main.playerOne!.name) choose an attacker !")
    var attacker = main.selectCharacter(player: main.playerOne!)
    var victim: Character
    if attacker is Mage {
        print("Select a character to treat :")
        victim = main.selectCharacter(player: main.playerOne!)
    }else {
        print("Now choose your victim !")
        victim =  main.selectCharacter(player: main.playerTwo!)
    }
    
    
    attacker.attack(victim: victim)
    print("\(victim.icon + " " + victim.name) has \(victim.lifePoint) lifes point left")
    print("\(main.playerTwo!.name) choose an attacker !")
    attacker = main.selectCharacter(player: main.playerTwo!)
    if attacker is Mage {
        print("Select a character to treat :")
        victim = main.selectCharacter(player: main.playerTwo!)
    }else {
        print("Now choose your victim !")
        victim =  main.selectCharacter(player: main.playerOne!)
    }
    attacker.attack(victim: victim)
    print("\(victim.icon + " " + victim.name) has \(victim.lifePoint) lifes point left")
    
}




