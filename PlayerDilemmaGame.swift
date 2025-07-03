import Foundation

protocol Strategy {
    var myChoices: [Bool] { get set }
    var opponentChoices: [Bool] { get set }
    func makeChoice() -> Bool
    func setOpponentChoice(_ choice: Bool)
    func updateMyChoice(_ choice: Bool) -> Bool
    func reset()
}

class StrategyImpl: Strategy {
    var myChoices: [Bool] = []
    var opponentChoices: [Bool] = []
    
    func makeChoice() -> Bool {
        return true
    }

    func setOpponentChoice(_ choice: Bool) {
        opponentChoices.append(choice)
    }

    func updateMyChoice(_ choice: Bool) -> Bool {
        myChoices.append(choice)
        return choice
    }

    func reset() {
        myChoices = []
        opponentChoices = []
    }
}

class AlwaysCooperateStrategy: StrategyImpl {
    override func makeChoice() -> Bool {
        return updateMyChoice(true)
    }
}

class AlwaysDefectStrategy: StrategyImpl {
    override func makeChoice() -> Bool {
        return updateMyChoice(false)
    }
}

class TitForTatStrategy: StrategyImpl {
    override func makeChoice() -> Bool {
        if let last = opponentChoices.last, !last {
            return updateMyChoice(false)
        }

        return updateMyChoice(true)
    }
}

class TwoTitsOneTatStrategy: StrategyImpl {
    override func makeChoice() -> Bool {
        if opponentChoices.count >= 2 {
            let lastTwo = opponentChoices.suffix(2)
            if lastTwo.allSatisfy({ !$0 }) {
                return updateMyChoice(false)
            }
        }
        return updateMyChoice(true)
    }
}

class OneTitForTwoTatStrategy: StrategyImpl {
    override func makeChoice() -> Bool {
        if opponentChoices.count >= 2 {
            let lastTwo = opponentChoices.suffix(2)
            if lastTwo.contains(false) {
                return updateMyChoice(false)
            }
        }
        return updateMyChoice(true)
    }
}

class GrimTriggerStrategy: StrategyImpl {
    override func makeChoice() -> Bool {
        if opponentChoices.contains(false) {
            return updateMyChoice(false)
        }

        return updateMyChoice(true)
    }
}

class SuspiciousStrategy: StrategyImpl {
    override func makeChoice() -> Bool {
        if myChoices.isEmpty {
            return updateMyChoice(false)
        }

        if let lastOpponentChoice = opponentChoices.last {
            return updateMyChoice(lastOpponentChoice)
        }

        return updateMyChoice(true)
    }
}

class Player {
    let name: String
    let strategy: Strategy

    init(name: String, strategy: Strategy) {
        self.name = name
        self.strategy = strategy
    }
}

class PlayersDilemmaGame {
    var players: [Player]
    var tournament: [String: Int] = [:]
    let ROUNDS = 200

    init() {
        let strategies: [(name: String, strategy: Strategy)] = [
            ("AlwaysCooperate", AlwaysCooperateStrategy()),
            ("AlwaysDefect", AlwaysDefectStrategy()),
            ("TitForTat", TitForTatStrategy()),
            ("TwoTitsForOneTat", TwoTitsOneTatStrategy()),
            ("OneTitForTwoTat", OneTitForTwoTatStrategy()),
            ("Grim", GrimTriggerStrategy()),
            ("SuspiciousTitForTat", SuspiciousStrategy()),
        ]

        self.players = strategies.map { Player(name: $0.name, strategy: $0.strategy) }
    }

    func startTournament() {
        let numberOfPlayers = players.count

        for i in 0..<numberOfPlayers {
            for j in i+1..<numberOfPlayers {
                let (player1, player2) = (players[i], players[j])
                startMatch(player1, player2)
            }
        }

        for (name, score) in tournament.sorted(by: { $0.value > $1.value }) {
            print("\(name) scored total \(score)")
        }
        print(tournament)
    }

    func startMatch(_ player1: Player, _ player2: Player) {
        // Reset
        player1.strategy.reset()
        player2.strategy.reset()

        var p1Points = 0, p2Points = 0
        for _ in 0..<ROUNDS {
            // Make choice
            let p1Choice = player1.strategy.makeChoice()
            let p2Choice = player2.strategy.makeChoice()
            // Set opponent choice
            player1.strategy.setOpponentChoice(p2Choice)
            player2.strategy.setOpponentChoice(p1Choice)
            // Get round point
            let (p1RoundPoints, p2RoundPoints) = processPointsByChoice(p1Choice, p2Choice)
            // Add match point
            p1Points += p1RoundPoints
            p2Points += p2RoundPoints
        }

        // Update tournament points
        tournament[player1.name, default: 0] += p1Points
        tournament[player2.name, default: 0] += p2Points
    }

    func processPointsByChoice(_ choice1: Bool, _ choice2: Bool) -> (Int, Int) {
        if choice1, choice2 { return (3, 3) }
        if choice1, !choice2 { return (0, 5) }
        if !choice1, choice2 { return (5, 0) }

        return (1, 1)
    }
}

let game = PlayersDilemmaGame()
game.startTournament()
