import Foundation

class BattleManager: ObservableObject {
    @Published var creature1: Creature
    @Published var creature2: Creature
    @Published var battleMessage: String = "The battle begins!" // Make sure this is marked with @Published
    
    var isBattleOver: Bool {
        creature1.health <= 0 || creature2.health <= 0
    }
    
    var isCreature1Turn: Bool
    
    init(
        creature1: Creature = .mockBulbasaur,
        creature2: Creature = .mockCharmander
    ) {
        self.creature1 = creature1
        self.creature2 = creature2
        // The faster creature goes first
        self.isCreature1Turn = creature1.speed >= creature2.speed
    }
    
    func startBattle() {
        // Initial battle setup if needed
        while !isBattleOver {
            let attacker = isCreature1Turn ? creature1 : creature2
            let defender = isCreature1Turn ? creature2 : creature1
            
            performTurn()
            
            if isBattleOver {
                print("Battle is over! Winner: \(attacker.name)")
                break
            }
            
            // Switch turns
            isCreature1Turn.toggle()
        }
    }
    
    func performTurn() {
        // Determine which creature attacks and receives the attack
        // Apply damage and animate health bar reduction
        // For the demo, we just decrement health by a fixed amount
        if creature1.speed >= creature2.speed {
            creature2.health -= 10
            // Add animations for attack and health depletion
        } else {
            creature1.health -= 10
            // Add animations for attack and health depletion
        }
    }
    
    func updateMessage(newMessage: String) {
        DispatchQueue.main.async {
            self.battleMessage = newMessage
        }
    }
}
