// Contains properties for colossus details.
class Colossus: Character {
    static let defaultIcon = "🏋️‍♂️"
    static let defaultLifepoint = 200
    static let defaultWeapon = Mace()
    
    
    init(colossusName: String) {
        super.init(name: colossusName, lifePoint: 200, weapon: Mace(), icon: "🏋️‍♂️")
    }
}

