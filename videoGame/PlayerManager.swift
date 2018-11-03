class PlayerManager {
    
    let playerOne: Player
    let playerTwo: Player
    
    init() {
        print("Player One enter your name: ")
        playerOne = PlayerManager.createPlayer()
        print("Player Two enter your name: ")
        playerTwo = PlayerManager.createPlayer()
    }

    
        
    
    /*Get the name of the users.
     Return Player with a name. */
    private static func createPlayer() -> Player {
        if let name = readLine(), playerManager.isValid(name: name){
            return Player (name: name)
        } else {
            print("Incorrect name, please enter a valid name !")
            return createPlayer()
        }
    }
    
/* Method which checks if name is valid.
     Parameter : Name to check
     Return true if name si not empty and if it doesn't already exist. */
    private func isValid(name: String) -> Bool {
        var nameList = getNames(player: playerOne)
        nameList.append(contentsOf: getNames(player: playerTwo))
        return !name.isEmpty && !nameList.contains(name)
    }
    
    
/*Get the names given by the user
     Parameter: optional
     Rerturn: array of String. Names list stored inside.*/
    private func getNames(player: Player?) -> [String] {
        if let p = player {
            CheckName.nameList.append(p.name)
            for character in p.team {
                CheckName.nameList.append(character.name)
            }
        }
        return CheckName.nameList
    }
    
}
