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
    
    }
}


var start = Main()
start.firstPlayer()
start.secondPlayer()
