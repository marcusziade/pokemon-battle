import Foundation
import SwiftUI

// BattleActionsView now includes a text-based interface at the bottom, mimicking the game's style.
struct BattleActionsView: View {
    @ObservedObject var battleManager: BattleManager
    
    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    battleManager.performTurn()
                }
            }) {
                Text("Attack")
                    .bold()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .disabled(battleManager.isBattleOver)
            
            Text(battleManager.battleMessage)
                .foregroundColor(.white)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
        }
        .font(.caption)
        .padding(.horizontal)
        .padding(.bottom, 5)
    }
}
