
import SwiftUI

struct PokemonNamed: View {
    @EnvironmentObject var vm: ViewModel
    let pokemon: Pokemon
    
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: BaseURL.image.rawValue +
                                String(vm.getPokemonId(pokemon: pokemon)) + Path.endPoint.rawValue)) { image in
                if let image = image {
                    image
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                        .frame(width: 150, height: 150)
                }
            } placeholder: {
                ProgressView()
                    .frame(width: 250, height: 250)
                    .progressViewStyle(CircularProgressViewStyle(tint: .yellow))
                    .scaleEffect(3)
            }
            Text("\(pokemon.name.capitalized)")
                .font(.title2)
                .foregroundColor(.black)
        }
    }
}


struct PokemonNamed_Previews: PreviewProvider {
    static var previews: some View {
        PokemonNamed(pokemon: Pokemon.samplePokemon)
            .environmentObject(ViewModel())
    }
}
