
import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()

    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150))
    ]
    @EnvironmentObject var launchSreenManager: LaunchScreenManager
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                    ForEach(vm.filteredPokemon) { pokemon in
                        NavigationLink(destination: PokemonDetailView(pokemon: pokemon)
                        ) {
                            PokemonNamed(pokemon: pokemon)
                        }
                    }
                }
                .animation(.easeInOut(duration: 0.3), value: vm.filteredPokemon.count)
                .navigationTitle("Pokemon")
                .toolbarBackground(Color("Yellow"), for: .navigationBar)
            }
            .searchable(text: $vm.searchText)
        }
        .environmentObject(vm)
        .accentColor(.white)
        .onAppear {
            DispatchQueue
                .main
                .asyncAfter(deadline: .now() + 1.2) {
                    launchSreenManager.dismiss()
                }
        }
        .alert(item: $vm.appError) { appError in
            Alert(title: Text("Oh Oh"), message: Text(appError.error.localizedDescription))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(LaunchScreenManager())
    }
}
