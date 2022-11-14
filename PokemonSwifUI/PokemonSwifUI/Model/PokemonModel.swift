import Foundation

struct PokemonPage: Codable {
    let count: Int
    let next: String
    let results: [Pokemon]
}

struct Pokemon: Codable, Identifiable, Equatable {
    let id = UUID()
    let name: String
    let url: String

    static var samplePokemon = Pokemon(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/")
}

struct DetailPokemon: Codable {
    let id: Int
    let height: Int
    let weight: Int
    let name: String
    let types : [Types]
    var pokemonType: String {
        return "Types: \(types.map{$0.type.name}.joined(separator: ", "))"
    }
}

//MARK: Pockemon's type
struct Types: Codable {
    let type: Name
}

struct Name: Codable {
    let name: String
}

