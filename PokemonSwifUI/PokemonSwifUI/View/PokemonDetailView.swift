import SwiftUI

struct PokemonDetailView: View {
    @EnvironmentObject var vm: ViewModel
    let pokemon: Pokemon
    let dimensions: Double = 250
    var body: some View {
        ZStack {
            Image("Bg")
                .resizable()
                .ignoresSafeArea(.all)
            Color.black.opacity(0.2)
                .ignoresSafeArea(.all)
            VStack {
                Spacer()
                VStack(alignment: .center) {
                    Text("Hello \n I'm \(vm.pokemonDetails?.name.capitalized ?? "")")
                        .padding()
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    Text("\(vm.pokemonDetails?.pokemonType.capitalized ?? "")")
                        .font(.title3)
                    HStack {
                        VStack {
                            Text("\(vm.formatHW(value: vm.pokemonDetails?.weight ?? 0)) kg")
                                .fontWeight(.bold)
                            Text("weight")
                        }
                        .padding(.horizontal)
                        Spacer()
                        VStack {
                            Text("\(vm.formatHW(value: vm.pokemonDetails?.height ?? 0)) m")
                                .fontWeight(.bold)
                            Text("height")
                        }
                        .padding(.horizontal)
                    }
                    .padding()
                }
                .background(Color("Yellow"))
                .cornerRadius(40)
                .offset(y: -8)
                .padding()
                .shadow(radius: 5)
                Spacer()

                PokemonView(pokemon: pokemon)
            }

        }
        
        .onAppear {

            vm.getDetails(pokemon: pokemon)
        }
    }
}

struct DetailVew_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: Pokemon.samplePokemon)
            .environmentObject(ViewModel())
    }
}
