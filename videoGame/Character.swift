import Foundation

// Mother class for each characters
class Character {
    var weapon: Weapon
    var lifePoint: Int
    var name: String
    var icon: String
    var totalDamage = 0
    
    init(name: String, lifePoint: Int, weapon: Weapon, icon: String) {
        self.name = name
        self.lifePoint = lifePoint
        self.weapon = weapon
        self.icon = icon
    }

    func attack(victim: Character) -> Int {
        victim.lifePoint -= weapon.pointOfDamage
        totalDamage += weapon.pointOfDamage
        return weapon.pointOfDamage
    }
    
    func isAlive() -> Bool {
        return self.lifePoint > 0
    }
    
    
    

    
    
    
}





