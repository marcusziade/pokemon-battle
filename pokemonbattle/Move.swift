import Foundation

struct Move {
    var name: String
    var power: Int
    var accuracy: Int
    var type: MoveType
    
    func calculateDamage(attacker: Creature, against opponent: Creature) -> Int {
        // Implementing a simplified version of the Pokémon damage formula
        let levelFactor = (2 * attacker.level) / 5 + 2
        let modifier = 1 // In a complete implementation, this would account for things like type effectiveness, critical hits, etc.
        let damage = (((levelFactor * power * attacker.attack) / opponent.defense) / 50 + 2) * modifier
        return Int(Float(damage) * (Float(arc4random_uniform(15)) + 85) / 100) // Adding random variance to the damage
    }
}

enum MoveType {
    case normal, fire, water, grass // Add as many types as needed
}
