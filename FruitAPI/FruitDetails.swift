import SwiftUI


@main
struct FruitDetails: App {
    @StateObject var api = FruitApi()
    @State var name: String = ""
    
    var body: some Scene {
        WindowGroup {
            VStack {
                HStack{
                    Image("orange")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70, height: 70)
                    Image("strawberry")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70, height: 70)
                    Text("Fruit")
                        .foregroundColor(.green)
                        .font(.largeTitle)
                    Image("Apple")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70, height: 70)
                    Image("banana")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70, height: 70)
                      
                }
                    self.api.fruit
                    TextField("Fruit name", text: $name)
                        .padding()
            }
            .onChange(of: self.name, perform: { name in
                self.api.fetchData(name: name)
            })
            .onAppear(perform: {
                self.api.fetchData(name: self.name)
            })
        }
    }
}
