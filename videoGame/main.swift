class Main {

    var playerOne: Player?
    var playerTwo: Player?
    
    func createPlayer() -> Player {
        print("Please enter your name :")
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
    
    
    func skillsCharacters() {
        print("Characters : "
            + "\n"
            + "\nFighter : The classic attacker, a good warrior !"
            + "\nLife: 100, Weapon: Sword)"
            + "\n"
            + "\nMage: His talent ? Heal the members of his team. "
            + "\nLife: 80, Weapon: Fire Stick)"
            + "\n"
            + "\nColossus: Imposing and very resistant, but it will not hurt you badly."
            + "\nLife: 200, Weapon: Mace)"
            + "\n"
            + "\nDarwf: His ax will deal you a lot of damage, but he does not have a lot of health."
            + "\nLife: 50, Weapon: Ax")
    }
    
    
}

Main().start()



