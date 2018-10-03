class TeamManager {
    
    let playerManager: PlayerManager
    
    init(playerManager: PlayerManager) {
        self.playerManager = playerManager
    }
    
/* Display choices to the users allows them to choose characters. The method get the answers of the users and returns a character. Then this method calls nameCharacter() in order to name the chosen character. If choice is not valid, the method returns an error message and restarts. */
    func chooseCharacters() -> Character  {
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
                print("Incorect choice. Please choose a character: ")
                return chooseCharacters()
            }
            
        }
        return chooseCharacters()
    }
    
    
    
/* Get characters's names given by the user. The method calls "isValid()" to check if name is not empty and if name doesn't already exists. If name is correct the method returns String, else it returns an error message and restarts. */
    func nameCharacter() -> String {
        print("Please name your character: ")
        if let name = readLine() {
            return name
        } else {
            print("Incorect name, please enter a valid name !")
            return nameCharacter()
        }
    

}/* Loop allowing each player to choose and name characters alternately. The "for" loop is runing until three characters are chosen by each user. Chosen characters are stored in "team" array of each players calling choosenCharacters() method allowing to display choices. */
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
