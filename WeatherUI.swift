import SwiftUI

struct WeatherView: View {
    @State private var temperature: Double = 72.0
    @State private var weatherCondition: String = "Sunny"
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Current Weather")
                .font(.title)
                .bold()
            
            Text("\(temperature)°F")
                .font(.system(size: 48))
            
            Text(weatherCondition)
                .font(.title2)
            
            Spacer()
            
            Button(action: {
                updateWeather()
            }) {
                Text("Refresh")
                    .padding()
                    .background(Color.blue)
                    .foreground(Color.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
    
    func updateWeather() {
        temperature = Double.random(in: 60...80)
        weatherCondition = ["Sunny", "Cloudy", "Rainy", "Snowy"][Int.random(in: 0..<4)]
    }
}

class ViewModell: ObservableObject {
    @Pulished var state: State = .loading
    let api: API = WeadherAPI()

    func getResponse() {
    state = .loading
    let data = api.getAWeatherData()

    state = .data(data)
    }
}
