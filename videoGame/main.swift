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

// Displays name of each player, also display the names and types of each character.
    func displayTeam() {
        print("\(playerOne!.name)! Your team is composed of the following characters: "
        + "\n\(playerOne!.team)"
        + "\nTheir names are: \(getNames(player: playerOne!))"
        + "\n"
        + "\n"
        + "\(playerTwo!.name)! Your team is composed of the following characters: "
        + "\n\(playerTwo!.team)"
        + "\nTheir names are: \(getNames(player: playerTwo!))")
        
    }


}

//Main's instance
let main = Main()
main.createPlayers()
main.displayCharacters()
main.populateTeam()
main.displayTeam()
