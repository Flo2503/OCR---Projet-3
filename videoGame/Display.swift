class Display {
    
    func sayHello() {
        print("Hello ! Let's start the game !!")
    }
    
    func displayCharacters() {
        print("""
            Characters :
            Fighter \(Fighter.defaultIcon): The classic attacker, a good warrior !
            Life Points: \(Fighter.defaultLifepoint) // Weapon: \(Fighter.defaultWeapon.name) \(Fighter.defaultWeapon.icon)
            
            Mage \(Mage.defaultIcon): His talent ? Heal the members of his team.
            Life Points: \(Mage.defaultLifepoint) // Weapon: \(Mage.defaultWeapon.name) \(Mage.defaultWeapon.icon)
            
            Colossus \(Colossus.defaultIcon): Imposing and very resistant, but it will not hurt you badly.
            Life Points: \(Colossus.defaultLifepoint) // Weapon: \(Colossus.defaultWeapon.name) \(Colossus.defaultWeapon.icon)
            
            Dwarf \(Dwarf.defaultIcon): His ax will deal you a lot of damage, but he does not have a lot of health.
            Life Points: \(Dwarf.defaultLifepoint) // Weapon: \(Dwarf.defaultWeapon.name) \(Dwarf.defaultWeapon.icon)
            
            """)
        
    }
    
/*Datas of team's players to display.
     Parameter: player, to get teams informations.
     */
    private func playerTeam(player: Player) {
        print("""
            
            \(player.name) ! Your team is composed by the following characters :
            """)
        for characters in (player.team) {
            print("""
                \(characters.icon) \(characters.name)
                Life Point: \(characters.lifePoint)
                Weapon: \(characters.weapon.name) \(characters.weapon.icon)
                """)
        }
    }
    
    func displayTeam(playerOne: Player, playerTwo: Player) {
        playerTeam(player: playerOne)
        playerTeam(player: playerTwo)
    }
        
}
