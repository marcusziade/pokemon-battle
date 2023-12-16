import Foundation
import SwiftUI

// BattleStatusView now includes HP, Level, and the health bar in a style reminiscent of the game.
struct BattleStatusView: View {
    let creature: Creature
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Text(creature.name)
                    .font(.caption)
                    .foregroundColor(.white)
                Spacer()
                Text("Lv\(creature.level)")
                    .font(.caption)
                    .foregroundColor(.white)
            }
            HealthBarView(health: creature.health, maxHealth: creature.maxHealth)
            Text("HP: \(creature.health)/\(creature.maxHealth)")
                .font(.caption)
                .foregroundColor(.white)
        }
        .padding(.horizontal)
        .background(Color.gray.opacity(0.5))
        .cornerRadius(5)
        .padding(.horizontal, 4)
    }
}
