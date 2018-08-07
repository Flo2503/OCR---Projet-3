class Mage: Character {
    static let defaultIcon = "🧙‍♂️"
    static let defaultLifepoint = 80
    static let defaultWeapon = FireStick()
    
    init(mageName: String) {
        super.init(name: mageName, lifePoint: 80, weapon: FireStick(), icon: "🧙‍♂️")
    }
}
