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

// Method allowing to attack. Return the number of point of damages.
    func attack(victim: Character) -> Int {
        victim.lifePoint -= weapon.pointOfDamage
        return weapon.pointOfDamage
    }
    
// Method to check if a character is alive. Return true if character's life point greater than zero.
    func isAlive() -> Bool {
        return self.lifePoint > 0
    }
    
    
    
}





