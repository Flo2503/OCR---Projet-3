class Main {
    var namePlayerOne = [Any]()
    var nameplayerTwo = [Any]()
    
    
    func firstPlayer() {
        print("Hello ! "
            + "\nPlease player one enter your name: ")
        if let playerOne = readLine() {
            namePlayerOne.append(playerOne)
            print("\(playerOne) is the player one !")
            
        }
    }
    
    func secondPlayer() {
        print("Please player two enter your name: ")
        if let playerTwo = readLine() {
            nameplayerTwo.append(playerTwo)
            print("\(playerTwo) is the player two !")
        }
    }
    
    func skillsCharacters() {
        print("Characters : "
            + "\n"
            + "\nFighter : The classic attacker, a good warrior !"
            + "\nLife : 100, Weapon : Sword(Damage 10)"
            + "\n"
            + "\nMage: His talent ? Heal the members of his team. "
            + "\nLife : 80, Weapon : Fire stick(Damage 8)"
            + "\n"
            + "\nColossus : Imposing and very resistant, but it will not hurt you badly."
            + "\nLife : 200, Weapon : Mace(Damage 5)"
            + "\n"
            + "\nDarwf : His ax will deal you a lot of damage, but he does not have a lot of health."
            + "\nLife : 50, Weapon : Ax(Damage 15)")
    }
    
    
}


var start = Main()
start.firstPlayer()
start.secondPlayer()
start.skillsCharacters()
