import Foundation

class Game {
  
    let playerManager: PlayerManager
    var currentPlayer: Player
    var nextPlayer: Player
    var turn = 0
    
    init(playerManager: PlayerManager) {
        currentPlayer = playerManager.playerOne
        nextPlayer = playerManager.playerTwo
        self.playerManager = playerManager
    }
    
    
    //Alternate players during the game.
    private func changePlayer() {
        let temp = currentPlayer
        currentPlayer = nextPlayer
        nextPlayer = temp
    }
    

    //
    private func selectCharacter(player: Player) -> Character {
        player.displayTeam()
        if let characterIndex = readLine() {
            if let index =  Int(characterIndex) {
                if let character = player.getCharacterAliveAt(index: index) {
                    return character

                }
                
            }
            
        }
        print("Incorrect choice, please select a character: ")
        return selectCharacter(player: player)
    }
   
/*Method allowing to change weapon of a character among several weapons stored in an array
     Parameter: */
    private func changeWeapon(character: Character) {
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
    
/*Get the character who inflict the mmost of damage during the game.
     Parameter: Array of Character.
     Return: The character who inflict the most of damage. */
    private func getBestCharacter(_ team: [Character]) -> Character {
        var best = team[0]
        for char in team {
            if char.totalDamage > best.totalDamage {
                best = char
            }
        }
        return best
    }
    
   
    
    func characterAttack() {
        print("\n\(currentPlayer.name) choose an attacker !")
        let attacker = selectCharacter(player: currentPlayer)
        if arc4random_uniform(5) == 3 {
            changeWeapon(character: attacker)
        }
        let victim: Character
        if attacker is Mage {
            print("Select a character to treat in your team 💉 :")
            victim = selectCharacter(player: currentPlayer)
            print("You treat \(victim.name) ❤️")
        } else {
            print("Now choose your victim !")
            victim =  selectCharacter(player: nextPlayer)
        }
        attacker.attack(victim: victim)
        if victim.lifePoint > 0 {
            print("\(victim.name) has \(victim.lifePoint) lifes point left"
                + "\n")
        } else {
            print("\(victim.name) is dead ☠️ "
                + "\n")
        }
        
        turn += 1
        
        if !nextPlayer.hasACharacterAlive() {
            print("""
                \(nextPlayer.name) all your characters are dead... You LOOSE... 😒
                \(currentPlayer.name) you annihilated the opposing team, you WIN !! 🎉 🎉
                """)
        }
    }
    
   
    func gameLoop() {
        while playerManager.playerOne.hasACharacterAlive() && playerManager.playerTwo.hasACharacterAlive() {
            characterAttack()
            changePlayer()
            
        }
    }
    
    func laps() {
        print("🏁 Number of laps during the game : \(turn) 🏁"
            + "\n")
    }
 
    func displayStat() {
        let best = getBestCharacter(playerManager.playerOne.team + playerManager.playerTwo.team)
        print("The character who inflicted the most points of dammage during the game is \(best.name) with \(best.totalDamage) points of damage."
            + "\n")
    }
    
    
   
    
}

















