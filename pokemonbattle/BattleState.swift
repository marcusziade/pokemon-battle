import Foundation

class BattleState {
    var battle: Battle
    var message: String
    
    init(battle: Battle) {
        self.battle = battle
        self.message = "\(battle.creature1.name) VS \(battle.creature2.name)!"
    }
    
    // Add methods to update the state based on the battle progress
}
