// Contains properties for dwarf details.
class Dwarf: Character {
    static let defaultIcon = "🧔"
    static let defaultLifepoint = 50
    static let defaultWeapon = Ax()
    
    init(dwarfName: String) {
        super.init(name: dwarfName, lifePoint: 50, weapon: Ax(), icon: "🧔")
    }
}
