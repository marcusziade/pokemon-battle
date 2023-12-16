import Foundation

class Battle {
    var creature1: Creature
    var creature2: Creature
    var turn: Creature
    
    init(creature1: Creature, creature2: Creature) {
        self.creature1 = creature1
        self.creature2 = creature2
        // Determine who goes first based on speed
        self.turn = creature1.speed > creature2.speed ? creature1 : creature2
    }
    
    func performMove(move: Move, by attacker: Creature, on defender: Creature) {
        let damage = move.calculateDamage(attacker: attacker, against: defender)
        defender.receiveDamage(damage)
        // Continue the battle logic (check for fainted, switch turn, etc.)
    }
}
