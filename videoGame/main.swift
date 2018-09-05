import Foundation

class Main {
    
    var playerOne: Player?
    var playerTwo: Player?
    
/* Get the name of the users. Call func "isValid" and returns a player if name is correct (if name is not empty and if name doesn't already exists).
     If conditions are not respected, the method returns an error message and restarts. */
    func createPlayer() -> Player {
        if let name = readLine(), isValid(name: name) {
            return Player(name: name)
        } else {
            print("Incorect name, please enter a valid name !")
            return createPlayer()
        }
    }

// Start the game and create players alternately. Player One calls createPlayer() then the player Two.
    func createPlayers() {
        print("Hello !"
        + "\nPlayer One enter your name:")
        playerOne = createPlayer()
        print("Player Two enter your name: ")
        playerTwo = createPlayer()
    }
    
    
// Display details of each character. Call static property in each character class (defaultIcon, and so on...).
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
    

/* Display choices to the users allows them to choose characters. The method get the answers of the users and returns a character. Then this method calls nameCharacter() in order to name the chosen character. If choice is not valid, the method returns an error message and restarts. */
    func chooseCharacters() -> Character  {
        print("\n1. Fighter \(Fighter.defaultIcon)"
            + "\n2. Mage \(Mage.defaultIcon)"
            + "\n3. Colossus \(Colossus.defaultIcon)"
            + "\n4. Dwarf \(Dwarf.defaultIcon)")
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
    
    
/* Get characters's names given by the user. The method calls "isValid()" to check if name is not empty and if name doesn't already exists. If name is correct the method returns String, else it returns an error message and restarts. */
    func nameCharacter() -> String {
        print("Please name your character: ")
        if let name = readLine(), isValid(name: name) {
            return name
        } else {
            print("Incorect name, please enter a valid name !")
            return nameCharacter()
        }
    }
    
/* Method wich checks if name is valid. Parameter called "name": type String. The metod returns true if name is not empty and if names already
     exists. The property nameList calls the method getNames() and gets each player in parameter. */
    func isValid(name: String) -> Bool {
        var nameList = getNames(player: playerOne)
        nameList.append(contentsOf: getNames(player: playerTwo))
        return !name.isEmpty && !nameList.contains(name)
    }
    

/* Method to avoid duplicate code in isValid() method. Parameter called player, type : Player. The method retunrs an array of String. Names of players and characters are stored in nameList array. A "for" loop is used to get names in "team" array of players. Then the're checked with the method isValid(). */
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

/* Loop allowing each player to choose and name characters alternately. The "for" loop is runig until three characters are chosen by each user. Chosen characters are stored in "team" array of each players calling choosenCharacters() method allowing to display choices. */
    func populateTeam() {
        for i in 0...2 {
            print("Player one choose a character: ")
            playerOne?.team.append(chooseCharacters())
            print("Player two choose a character: ")
            playerTwo?.team.append(chooseCharacters())
        }
        
    }


/* The method gets Player in parameter. A loop "for" is used to iterate over "team" array of each players allowing to display details (names, icons, and life points) of each characters in teams. */
    func playerTeam(player: Player?) {
        print("\n"
            + "\n\(player!.name) ! Your team is composed by the following characters :")
        for characters in player!.team {
            print("\(characters.icon) \(characters.name)"
                + "\nLife Point: \(characters.lifePoint)"
                + "\nWeapon: \(characters.weapon.name) \(characters.weapon.icon) "
                + "\n")
        }
    }
    

// Method allowing to call each player for the method "playerTeam()".
    func displayTeam() {
        playerTeam(player: playerOne)
        playerTeam(player: playerTwo)
    }
 

/* Method wich gets a player in parameter allowing to alternate player one and player two. It allows for each players to select a character in their own team in order to attack. The loop "for" iterates over players's team displaying an index for each characters, usefull for the users in order to select the character. The loop only displays the living characters calling isAlive() method. Then the method gets the user's answer. "Int(characterIndex)" -> readline() throws a string, so we switch it in Int. "player.team.indices.contains(index)" -> We check if the answer of the user is in the index. Then the choice of the user is stored in "character" property if the character is alive. If the answer of the user in incorect or if the character is dead, the method print an error message and returns the method. */
    func selectCharacter(player: Player) -> Character {
        for (index, character) in player.team.enumerated() {
            if character.isAlive() {
                print(index, ":", character.icon + " " + character.name + " ",  character.lifePoint, "❤️")
            }
        }
        if let characterIndex = readLine() {
            if let index = Int(characterIndex), player.team.indices.contains(index) {
              let character = player.team[index]
                if character.isAlive() {
                    print("You selected \(character.name)"
                    + "\n")
                    return character
                } else {
                    print("This character is dead, choose an other one: ")
                    return selectCharacter(player: player)
                }
            }
        }
        print("Incorect choice, please select a character: ")
        return selectCharacter(player: player)
    }
    
    func changeWeapon(character: Character) {
        if character is Mage {
            let newWeapon = [LowHealing(), SuperHealing()]
            let randomIndex = Int(arc4random_uniform(UInt32(newWeapon.count)))
            character.weapon = (newWeapon[randomIndex])
            print("A chest appears and \(character.name) gets a new power ! His power is replaced by \(character.weapon.name + " " + character.weapon.icon)"
                + "\n")
        } else {
            let newWeapon = [Hammer(), DeathSickle(), TemplarSword(), Knife()]
            let randomIndex = Int(arc4random_uniform(UInt32(newWeapon.count)))
            character.weapon = (newWeapon[randomIndex])
            print("A chest appears and \(character.name) gets a new weapon ! His weapon is replaced by \(character.weapon.name + " " + character.weapon.icon)"
                + "\n")

        }
    }
    
}


//Main's instance
let main = Main()
main.createPlayers()
main.displayCharacters()
main.populateTeam()
main.displayTeam()


/* Loop "while" allowing to each players to attack or treat alternately. It runs as long as each team has a character alive, calling method "hasACharacterAlive()" for each player. The loop calls "selectCharacter()" allowing to the user to select an attcker in this team. Loop checks if character is of type Mage (thanks to "if _ is" allowing to check the type of an object). If character is a mage victime displays the team of the player to treat a character, otherwise victim displays the team opponent to attack. */

guard let playerOne = main.playerOne, let playerTwo = main.playerTwo else {
    fatalError()
}

while playerOne.hasACharacterAlive() && playerTwo.hasACharacterAlive() {
    print("\(playerOne.name) choose an attacker !")
    var attacker = main.selectCharacter(player: playerOne)
    if arc4random_uniform(5) == 3 {
        main.changeWeapon(character: attacker)
    }
    var victim: Character
    if attacker is Mage {
        print("Select a character to treat in your team 💉 :")
        victim = main.selectCharacter(player: playerOne)
        print("You treat \(victim.name) ❤️")
    } else {
        print("Now choose your victim !")
        victim =  main.selectCharacter(player: playerTwo)
    }
    attacker.attack(victim: victim)

    if victim.lifePoint > 0 {
        print("\(victim.name) has \(victim.lifePoint) lifes point left"
             + "\n")
    } else {
        print("\(victim.name) is dead 🧟 "
             + "\n")
    }
    if !playerTwo.hasACharacterAlive() {
        print("\(playerTwo.name) all your characters are dead... You LOOSE... 😒 "
            + "\n"
            + "\n\(playerOne.name) you annihilated the opposing team, you WIN !! 🎉 🎉")
        break
    }
    print("\(playerTwo.name) choose an attacker !")
    attacker = main.selectCharacter(player: playerTwo)
    if arc4random_uniform(5) == 3 {
        main.changeWeapon(character: attacker)
    }
    if attacker is Mage {
        print("Select a character to treat in your team 💉 :")
        victim = main.selectCharacter(player: playerTwo)
        print("You treat \(victim.name) ❤️")
    } else {
        print("Now choose your victim !")
        victim  =  main.selectCharacter(player: playerOne)
    }
    attacker.attack(victim: victim)
    if victim.lifePoint > 0 {
        print("\(victim.name) has \(victim.lifePoint) lifes point left"
            + "\n")
    } else {
        print("\(victim.name) is dead 🧟 "
             + "\n")
    }
    if !playerOne.hasACharacterAlive() {
        print("\(playerOne.name) all your character are dead... You LOOSE... 😒 "
            + "\n"
            + "\n\(playerTwo.name) you annihilated the opposing team, you WIN !! 🎉 🎉")
        break
        
    }
    
    

}







