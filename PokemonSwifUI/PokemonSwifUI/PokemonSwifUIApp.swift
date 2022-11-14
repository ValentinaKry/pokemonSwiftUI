
import SwiftUI

@main
struct PokemonSwifUIApp: App {
    @StateObject var launchScreenManager = LaunchScreenManager()
    var body: some Scene {
        WindowGroup {
            ZStack {
                ContentView()

                if launchScreenManager.state != .completed {
                    LaunchScreen()
                }
            }
            .environmentObject(launchScreenManager)
        }
    }
}
