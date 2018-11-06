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
        if let name = readLine(), CheckName.isValid(name: name) {
            return Player (name: name)
        } else {
            print("Incorrect name, please enter a valid name !")
            return createPlayer()
        }
    }
    
    
}
