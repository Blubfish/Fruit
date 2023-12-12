import SwiftUI

class FruitApi: ObservableObject{
    @Published var fruit = Fruit()
    
    func fetchData(name: String) {
        Task {
            let endpoint = "https://www.fruityvice.com/api/fruit/\(name)"
            guard let url = URL(string: endpoint) else { throw fruitError.invalidURL }
            
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                throw fruitError.invalidResponse
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            self.fruit = try decoder.decode(Fruit.self, from: data)
        }
    }
}

enum fruitError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
