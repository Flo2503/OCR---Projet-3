// Mother class for each player.
class Player {
    let name: String
    var team = [Character]()
    
    init(name: String) {
        self.name = name
    }
    
    func hasACharacterAlive() -> Bool {
        return !team.filter({$0.isAlive()}).isEmpty
    }
}

