import Foundation

class Game {
  
    let playerManager: PlayerManager
    
    init(playerManager: PlayerManager) {
        self.playerManager = playerManager
    }
    
/* Method wich gets a player in parameter allowing to alternate player one and player two. It allows for each players to select a character in their own team in order to attack. The loop "for" iterates over players's team displaying an index for each characters, usefull for the users in order to select the character. The loop only displays the living characters calling isAlive() method. Then the method gets the user's answer. "Int(characterIndex)" -> readline() throws a string, so we switch it in Int. "player.team.indices.contains(index)" -> We check if the answer of the user is in the index. Then the choice of the user is stored in "character" property if the character is alive. If the answer of the user in incorect or if the character is dead, the method print an error message and returns the method. */
    func selectCharacter(player: Player) -> Character {
        for (index, character) in player.team.enumerated() {
            if character.isAlive() {
                print(index, ":", character.icon + " " + character.name + " ", "❤️",  character.lifePoint, " ", character.weapon.icon, "Damage:",  character.weapon.pointOfDamage)
            }
        }
        if let characterIndex = readLine() {
            if let index = Int(characterIndex), player.team.indices.contains(index) {
                let character = player.team[index]
                if character.isAlive() {
                    print("""
                        You selected \(character.name)
                        
                        """)
                    return character
                } else {
                    print("This character is dead, choose an other one: ")
                    return selectCharacter(player: player)
                }
            }
        }
        print("Incorect choice, please select a character: ")
        return selectCharacter(player: player)
    }
   
/* Method allowing to change weapon of a character among several weapons stored in an array. Weapon is selected randomly. Method is called in the game loop. */
    func changeWeapon(character: Character) {
        if character is Mage {
            let newWeapon = [LowHealing(), SuperHealing()]
            let randomIndex = Int(arc4random_uniform(UInt32(newWeapon.count)))
            character.weapon = newWeapon[randomIndex]
            print("""
                A chest appears and \(character.name) gets a new power ! His power is replaced by \(character.weapon.name + " " + character.weapon.icon)
                
                """)
        } else {
            let newWeapon = [Hammer(), DeathSickle(), TemplarSword(), Knife()]
            let randomIndex = Int(arc4random_uniform((UInt32(newWeapon.count))))
            character.weapon = newWeapon[randomIndex]
            print("""
                A chest appears and \(character.name) gets a new weapon ! His weapon is replaced by \(character.weapon.name + " " + character.weapon.icon)
                
                """)
            
        }
    }

    // Var for game stat.
    var turn = 0
    var damageStatistic = [String: Int]()
    
    
    // Displays the number of laps during the game.
    func laps() {
        print("🏁 Number of laps during the game : \(turn) 🏁"
            + "\n")
    }
    
    
    var damagePrevious = 0
    var attackerName: String?
    
    // "Bonus" Algorithm checking the highest value in dictionary. The highest value is stored in "let damage" constant.
    func damStat() {
        for damageStatistic in damageStatistic {
            let damage = damageStatistic.value
            
            if damagePrevious < damage {
                damagePrevious = damage
                attackerName = damageStatistic.key
                
            }
        }
    }
/* Loop "while" allowing to each players to attack or treat alternately. It runs as long as each team has a character alive, calling method "hasACharacterAlive()" for each player. The loop calls "selectCharacter()" allowing to the user to select an attcker in this team. Loop checks if character is of type Mage (thanks to "if _ is" allowing to check the type of an object). If character is a mage victime displays the team of the player to treat a character, otherwise victim displays the team opponent to attack. */
    func gameLoop() {
        
        while playerManager.playerOne.hasACharacterAlive() && playerManager.playerTwo.hasACharacterAlive() {
            print("\n\(playerManager.playerOne.name) choose an attacker !")
            var attacker = selectCharacter(player: playerManager.playerOne)
            if arc4random_uniform(5) == 3 {
                changeWeapon(character: attacker)
            }
            var victim: Character
            if attacker is Mage {
                print("Select a character to treat in your team 💉 :")
                victim = selectCharacter(player: playerManager.playerOne)
                print("You treat \(victim.name) ❤️")
            } else {
                print("Now choose your victim !")
                victim =  selectCharacter(player: playerManager.playerTwo)
            }
            
            let playerOneDammage = attacker.attack(victim: victim)
            // "Bonus" Gets the number of points of damage for each character of player One during the  game.
            damageStatistic[attacker.name] = (damageStatistic[attacker.name] ?? 0) + playerOneDammage
            
            if victim.lifePoint > 0 {
                print("\(victim.name) has \(victim.lifePoint) lifes point left"
                    + "\n")
            } else {
                print("\(victim.name) is dead ☠️ "
                    + "\n")
            }
            
            // "Bonus" Account the number of laps of the game.
            turn += 1
            
            if !playerManager.playerTwo.hasACharacterAlive() {
                print("""
                    \(playerManager.playerTwo.name) all your characters are dead... You LOOSE... 😒
                    \(playerManager.playerOne.name) you annihilated the opposing team, you WIN !! 🎉 🎉
                    """)
                break
            }
            print("\(playerManager.playerTwo.name) choose an attacker !")
            attacker = selectCharacter(player: playerManager.playerTwo)
            if arc4random_uniform(5) == 3 {
                changeWeapon(character: attacker)
            }
            if attacker is Mage {
                print("Select a character to treat in your team 💉 :")
                victim = selectCharacter(player: playerManager.playerTwo)
                print("You treat \(victim.name) ❤️")
            } else {
                print("Now choose your victim !")
                victim  =  selectCharacter(player: playerManager.playerOne)
            }
            
            let playerTwoDammage = attacker.attack(victim: victim)
            // "Bonus" Gets the number of points of damage for each character of player Two during the  game.
            damageStatistic[attacker.name] = (damageStatistic[attacker.name] ?? 0) + playerTwoDammage
            
            if victim.lifePoint > 0 {
                print("\(victim.name) has \(victim.lifePoint) lifes point left"
                    + "\n")
            } else {
                print("\(victim.name) is dead ☠️ "
                    + "\n")
            }
            // "Bonus" Account the number of laps of the game.
            turn += 1
            
            if !playerManager.playerOne.hasACharacterAlive() {
                print("""
                    \(playerManager.playerTwo.name) all your characters are dead... You LOOSE... 😒
                    \(playerManager.playerOne.name) you annihilated the opposing team, you WIN !! 🎉 🎉
                    """)
                break
                
            }
            
        }
    }
 
// "Bonus" Displays the character who inflicted the most points of damage during the game.
    func displayStat() {
        print("The character who inflicted the most points of dammage during the game is \(attackerName!) with \(damagePrevious) points of damage."
            + "\n")
    }
    
    
}

















