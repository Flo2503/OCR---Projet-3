// Mother class for each player.
class Player {

    let name: String
    var team = [Character]()
    
    init(name: String) {
        self.name = name
    }
    

    func displayTeam() {
        for (index, character) in team.enumerated() {
            if character.isAlive() {
                print(index, ":", character.icon + " " + character.name + " ", "❤️",  character.lifePoint, " ", character.weapon.icon, "Damage:",  character.weapon.pointOfDamage)
            }
        }
    }
    
    func getCharacterAliveAt(index: Int) -> Character? {
        if team.indices.contains(index) {
            let character = team[index]
            if character.isAlive() {
                print("""
                    You selected \(character.name)
                    
                    """)
                return character
            }
        }
        return nil
    }
    
    
// Method filtering team of players (checking if characters are alive). Returns true if team is not empty.
    func hasACharacterAlive() -> Bool {
        return !team.filter({$0.isAlive()}).isEmpty
    }
    
    
    
}


