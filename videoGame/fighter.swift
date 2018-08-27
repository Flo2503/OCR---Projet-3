// Contains properties for fighter details.
class Fighter: Character {
    static let defaultIcon = "💂‍♂️"
    static let defaultLifepoint = 100
    static let defaultWeapon = Sword()
    
    
    init(fighterName: String) {
        super.init(name: fighterName, lifePoint: Fighter.defaultLifepoint, weapon: Fighter.defaultWeapon, icon: Fighter.defaultIcon)
    }
    
}

