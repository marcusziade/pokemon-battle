import SwiftUI

// HealthBarView now has a more retro look, matching the original game.
struct HealthBarView: View {
    var health: Int
    var maxHealth: Int
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .foregroundColor(Color.white.opacity(0.5))
                
                Rectangle()
                    .frame(width: (geometry.size.width * CGFloat(health) / CGFloat(maxHealth)), height: geometry.size.height)
                    .foregroundColor(health > 20 ? .green : .red)
                    .animation(.linear, value: health)
            }
        }
        .frame(height: 6)
    }
}
