class TeamManager {
    
    let playerManager: PlayerManager
    
    init(playerManager: PlayerManager) {
        self.playerManager = playerManager
    }
    
/* Display choices to the users allows them to choose characters.
     Return a selected character with a name.*/
    private func chooseCharacters() -> Character  {
        print("""
            1. Fighter \(Fighter.defaultIcon)
            2. Mage \(Mage.defaultIcon)
            3. Colossus \(Colossus.defaultIcon)
            4. Dwarf \(Dwarf.defaultIcon)
            """)
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
                print("Incorrect choice. Please choose a character: ")
                return chooseCharacters()
            }
            
        }
        return chooseCharacters()
    }
    
    
    
/* Get characters's names given by the user.
     Return characyer's name */
    private func nameCharacter() -> String {
        print("Please name your character: ")
        if let name = readLine() {
            return name
        } else {
            print("Incorrect name, please enter a valid name !")
            return nameCharacter()
        }
    }
    
    
    // Loop allowing each player to choose and name characters alternately.
    func populateTeam() {
        var populate = 0
        while populate < 3 {
            print("Player one choose a character: ")
            playerManager.playerOne.team.append(chooseCharacters())
            print("Player two choose a character: ")
            playerManager.playerTwo.team.append(chooseCharacters())
            populate += 1
        }
        
    }
    
    
}
