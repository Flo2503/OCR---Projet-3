let display = Display()
display.sayHello()
let playerManager = PlayerManager()
display.displayCharacters()
let teamManager = TeamManager(playerManager: playerManager)
teamManager.populateTeam()
let game = Game(playerManager: playerManager)
game.gameLoop()

