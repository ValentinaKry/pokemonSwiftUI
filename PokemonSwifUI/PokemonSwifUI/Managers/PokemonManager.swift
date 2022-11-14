import Foundation

class PokemonManager {
    func getPokemon() -> [Pokemon] {
        let data: PokemonPage = Bundle.main.decode(file:"pokemon.json")
        let pokemon: [Pokemon] = data.results
        return pokemon
    }

    func getDetailedPokemon(id: Int, _ completion:@escaping (DetailPokemon) -> (), errorHandler: @escaping  (NetworkError) -> Void) {
        Bundle.main.fetchData(url: BaseURL.authorization.rawValue + String(id) + "/", model: DetailPokemon.self) { data in
            completion(data)
            print(data)

        } errorHandler: { error in
            print(error)
        }
    }
}

