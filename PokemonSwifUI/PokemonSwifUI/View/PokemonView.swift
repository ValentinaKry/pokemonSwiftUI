
import SwiftUI

struct PokemonView: View {
    @EnvironmentObject var vm: ViewModel
    let pokemon: Pokemon
    let dimensions: Double = 250
    var body: some View {
        VStack {

            AsyncImage(url: URL(string: BaseURL.image.rawValue +
                                String(vm.getPokemonId(pokemon: pokemon)) + Path.endPoint.rawValue)) { image in
                if let image = image {
                    image
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                        .frame(width: 250, height: 250)
                }
            } placeholder: {
                ProgressView()
                    .frame(width: 250, height: 250)
            }
        }
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView(pokemon: Pokemon.samplePokemon)
            .environmentObject(ViewModel())
    }
}
