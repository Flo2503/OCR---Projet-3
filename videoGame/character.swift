// Mother class for each characters
class Character {
    var weapon: Weapon
    var lifePoint: Int
    var name: String
    var icon: String
    
    init(name: String, lifePoint: Int, weapon: Weapon, icon: String) {
        self.name = name
        self.lifePoint = lifePoint
        self.weapon = weapon
        self.icon = icon
    }
    
    func attack(victim: Character) {
        victim.lifePoint -= weapon.pointOfDamage
    }
    
    func isAlive() -> Bool {
        return self.lifePoint > 0
    }
}




