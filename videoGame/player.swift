// Mother class for each player.
class Player {
    let name: String
    var team = [Character]()
    
    init(name: String) {
        self.name = name
    }
    
// Method filtering team of players (checking if characters are alive). Returns true if team is not empty.
    func hasACharacterAlive() -> Bool {
        return !team.filter({$0.isAlive()}).isEmpty
    }
}

