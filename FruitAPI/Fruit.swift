import SwiftUI

struct Fruit: Codable, Hashable, View {
    var name = ""
    var family = String()
    var genus = String()
    var id = Int()
    var nutritions = Nutritions()
    
    var body: some View {
        List {
            Text(self.name)
            self.nutritions
        }
    }
}

struct Nutritions: Codable, Hashable, View {
    var calories = 0.0
    var fat = 0.0
    var protein = 0.0
    var sugar = 0.0
    var carbohydrates = 0.0
    
    var body: some View {
        Text("Calories: \(String(self.calories))")
        Text("Fat: \(String(self.fat))g")
        Text("Sugar: \(String(self.sugar))g")
        Text("Protein: \(String(self.protein))g")
    }
}


