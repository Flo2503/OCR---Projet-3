class Main {
    
    var playerOne: Player?
    var playerTwo: Player?
    
    func createPlayer() -> Player {
        if let name = readLine() {
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
            + "\nFighter \(Fighter(fighterName: "").icon): The classic attacker, a good warrior !"
            + "\nLife Points: \(Fighter(fighterName: "").lifePoint) // Weapon: \(Fighter(fighterName: "").weapon.name) \(Fighter(fighterName: "").weapon.icon)"
            + "\n"
            + "\nMage \(Mage(mageName: "").icon): His talent ? Heal the members of his team. "
            + "\nLife Points: \(Mage(mageName: "").lifePoint) // Weapon: \(Mage(mageName: "").weapon.name) \(Mage(mageName: "").weapon.icon)"
            + "\n"
            + "\nColossus \(Colossus(colossusName: "").icon): Imposing and very resistant, but it will not hurt you badly."
            + "\nLife Points: \(Colossus(colossusName: "").lifePoint) // Weapon: \(Colossus(colossusName: "").weapon.name) \(Colossus(colossusName: "").weapon.icon)"
            + "\n"
            + "\nDwarf \(Dwarf(dwarfNAme: "").icon): His ax will deal you a lot of damage, but he does not have a lot of health."
            + "\nLife Points: \(Dwarf(dwarfNAme: "").lifePoint) // Weapon: \(Dwarf(dwarfNAme: "").weapon.name) \(Dwarf(dwarfNAme: "").weapon.icon)"
            + "\n")
        
    }
    
    
    func chooseCharacters() -> Character  {
        print("Choose a character: "
            + "\n1. Fighter"
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
                return Dwarf(dwarfNAme: nameCharacter())
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
        var nameList = [String]()
        if let p1 = playerOne {
            nameList.append(p1.name)
            for character in p1.team {
            nameList.append(character.name)
            }
        }
        if let p2 = playerTwo {
            nameList.append(p2.name)
            for character in p2.team {
            nameList.append(character.name)
            }
        }
            
        return !name.isEmpty && !nameList.contains(name)
    }
    
    
    
}

let main = Main()
main.createPlayers()
main.displayCharacters()
print(main.chooseCharacters().name)
