class Main {
    
    var playerOne: Player?
    var playerTwo: Player?
    
    func createPlayer() -> Player {
        if let name = readLine(), isValid(name: name) {
            return Player(name: name)
        }else {
            print("Incorect name, please enter a valid name !")
            return createPlayer()
        }
    }
    
    func createPlayers() {
        print("Hello !"
        + "\nPlayer One enter your name:")
        playerOne = createPlayer()
        print("Player Two enter your name: ")
        playerTwo = createPlayer()
    }
    
    
    
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
    
    
    func nameCharacter() -> String {
        print("Please name your character: ")
        if let name = readLine(), isValid(name: name) {
            return name
        }else {
            print("Incorect name, please enter a valid name !")
            return nameCharacter()
        }
    }
    
    func isValid(name: String) -> Bool {
        var nameList = getNames(player: playerOne)
        nameList.append(contentsOf: getNames(player: playerTwo))
        
        return !name.isEmpty && !nameList.contains(name)
    }
    
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
    
    func populateTeam() {
        for i in 0...2 {
            print("Player one choose a character: ")
            playerOne?.team.append(main.chooseCharacters())
            print("Player two choose a character: ")
            playerTwo?.team.append(main.chooseCharacters())
        }
        
    }
    
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
let main = Main()
main.createPlayers()
main.displayCharacters()
main.populateTeam()
main.displayTeam()
