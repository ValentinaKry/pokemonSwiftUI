import Foundation
import SwiftUI

final class ViewModel: ObservableObject {
    private let pokemonMananger = PokemonManager()

    @Published var pokemonList = [Pokemon]()
    @Published var pokemonDetails: DetailPokemon?
    @Published var searchText = ""
    @Published var appError: ErrorType? = nil

    var filteredPokemon: [Pokemon] {
        return searchText == "" ? pokemonList : pokemonList.filter{
            $0.name.contains(searchText.lowercased())
        }
    }

    init() {
        self.pokemonList = pokemonMananger.getPokemon()
    }

    func getPokemonId(pokemon: Pokemon) -> Int {
        if let id = self.pokemonList.firstIndex(of: pokemon) {
            return id + 1
        }

        return 0
    }

    func getDetails(pokemon: Pokemon) {
        let id = getPokemonId(pokemon: pokemon)

        self.pokemonDetails = DetailPokemon(id: 0, height: 0, weight: 0, name: "", types: [])

        pokemonMananger.getDetailedPokemon(id: id) { data in
            DispatchQueue.main.async {
                self.pokemonDetails = data
            }
        } errorHandler: {  errorMessage in
            self.appError = ErrorType(error: .downloadError)
        }

    }

    func formatHW(value: Int) -> String {
        let dValue = Double(value)
        let string = String(format: "%.2f", dValue / 10)

        return string
    }
}
