class PlayerManager {
    
    let playerOne: Player
    let playerTwo: Player
    
    init() {
        print("Player One enter your name: ")
        playerOne = PlayerManager.createPlayer()
        print("Player Two enter your name: ")
        playerTwo = PlayerManager.createPlayer()    }
    
    
/* Get the name of the users. Call method "isValid" and returns a player if name is correct (if name is not empty and if name doesn't already exists).
     If conditions are not respected, the method returns an error message and restarts. */
    private static func createPlayer() -> Player {
        if let name = readLine() {
            return Player(name: name)
        } else {
            print("Incorect name, please enter a valid name !")
            return createPlayer()
        }
    }
    
/* Method wich checks if name is valid. Parameter called "name": type String. The metod returns true if name is not empty and if names already
     exists. The property nameList calls the method getNames() and gets each player in parameter. */
    private func isValid(name: String) -> Bool {
        var nameList = getNames(player: playerOne)
        nameList.append(contentsOf: getNames(player: playerTwo))
        return !name.isEmpty && !nameList.contains(name)
    }
    
    
/* Method to avoid duplicate code in isValid() method. Parameter called player, type : Player. The method retunrs an array of String. Names of players and characters are stored in nameList array. A "for" loop is used to get names in "team" array of players. Then the're checked with the method isValid(). */
    private func getNames(player: Player?) -> [String] {
        var nameList = [String]()
        if let p = player {
            nameList.append(p.name)
            for character in p.team {
                nameList.append(character.name)
            }
        }
        return nameList
    }
    
}
