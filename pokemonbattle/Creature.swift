import Foundation

class Creature {
    let id = UUID()
    
    var name: String
    var level: Int
    var health: Int
    var maxHealth: Int
    var attack: Int
    var defense: Int
    var speed: Int
    var moves: [Move]
    
    init(name: String, level: Int, health: Int, attack: Int, defense: Int, speed: Int, moves: [Move]) {
        self.name = name
        self.level = level
        self.health = health
        self.maxHealth = health
        self.attack = attack
        self.defense = defense
        self.speed = speed
        self.moves = moves
    }
    
    func receiveDamage(_ damage: Int) {
        health = max(0, health - damage)
    }
    
    func performMove(move: Move, on defender: Creature) {
        let damage = move.calculateDamage(attacker: self, against: defender)
        defender.receiveDamage(damage)
    }
}

extension Creature {
    
    static var mockBulbasaur: Creature {
        Creature(
            name: "Bulbasaur",
            level: 5,
            health: 100,
            attack: 12,
            defense: 10,
            speed: 10,
            moves: [Move(
                name: "Tackle",
                power: 40,
                accuracy: 100,
                type: .normal
            )]
        )
    }
    
    static var mockCharmander: Creature {
        Creature(
            name: "Charmander",
            level: 5,
            health: 100,
            attack: 13,
            defense: 9,
            speed: 11,
            moves: [Move(
                name: "Scratch",
                power: 40,
                accuracy: 100,
                type: .normal
            )]
        )
    }
}
