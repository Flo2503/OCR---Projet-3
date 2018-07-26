class Main {

    var playerOne: Player?
    var playerTwo: Player?
    
    func createPlayer() -> Player {
        print("Hello! Please enter your name :")
        if let name = readLine() {
            return Player(name: name)
        }else {
            print("Incorect name, please enter a valid name !")
            return createPlayer()
        }
    }
    
    func start() {
        playerOne = createPlayer()
        playerTwo = createPlayer()
    }
    
    
    
    func displayCharacters() {
        print("Characters : "
            + "\n"
            + "\nFighter \(Fighter(fighterName: "").icon): The classic attacker, a good warrior !"
            + "\nLife Points: \(Fighter(fighterName: "").lifePoint) // Weapon: \(Fighter(fighterName: "").weapon.name) \(Fighter(fighterName: "").weapon.icon)"
            + "\n"
            + "\nMage \(Mage(mageName: "").icon): His talent ? Heal the members of his team. "
            + "\nLife Points: \(Mage(mageName: "").lifePoint) // Weapon: \(Mage(mageName: "").weapon.name) \(Mage(mageName: "").weapon.icon)"
            + "\n"
            + "\nColossus \(Colossus(colossusName: "").icon): Imposing and very resistant, but it will not hurt you badly."
            + "\nLife Points: \(Colossus(colossusName: "").lifePoint) // Weapon: \(Colossus(colossusName: "").weapon.name) \(Colossus(colossusName: "").weapon.icon)"
            + "\n"
            + "\nDarwf \(Darwf(darwfName: "").icon): His ax will deal you a lot of damage, but he does not have a lot of health."
            + "\nLife Points: \(Darwf(darwfName: "").lifePoint) // Weapon: \(Darwf(darwfName: "").weapon.name) \(Darwf(darwfName: "").weapon.icon)"
            + "\n")
        
    }
    
    func chooseCharacters() {
        print("Choose a character !"
        + "\n1. Fighter"
        + "\n2. Mage"
        + "\n3. Colossus"
        + "\n4. Darwf")
        
        
    }
    
    
}

Main().start()
var characters = Main()
characters.displayCharacters()
characters.chooseCharacters()

