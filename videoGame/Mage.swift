// Contains properties for mage details.
class Mage: Character {
    static let defaultIcon = "🧙‍♂️"
    static let defaultLifepoint = 80
    static let defaultWeapon = HealingPower()
    
    init(mageName: String) {
        super.init(name: mageName, lifePoint: 80, weapon: HealingPower(), icon: "🧙‍♂️")
    }
    
    
}
