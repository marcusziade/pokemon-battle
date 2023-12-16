import SwiftUI

struct BattleScreen: View {
    @StateObject var battleManager = BattleManager()
    
    var body: some View {
        ZStack {
            // Background
            Color.black.edgesIgnoringSafeArea(.all)
            
            // Battle scene
            VStack {
                // Opponent
                HStack {
                    Spacer()
                    VStack(alignment: .trailing) {
                        BattleStatusView(creature: battleManager.creature2)
                        Image("opponent_sprite") // Replace with your opponent image asset name
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .padding(.top, -20) // Adjust padding to fit your UI
                    }
                }
                
                Spacer()
                
                // Player
                HStack {
                    VStack(alignment: .leading) {
                        Image("player_sprite") // Replace with your player image asset name
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .padding(.bottom, -20) // Adjust padding to fit your UI
                        BattleStatusView(creature: battleManager.creature1)
                    }
                    Spacer()
                }
                
                // Battle actions
                BattleActionsView(battleManager: battleManager)
                    .padding()
            }
        }
    }
}
