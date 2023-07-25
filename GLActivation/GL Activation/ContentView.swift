
import CoreLocationUI
import CoreLocation
import MapKit
import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ContentViewModel()
    @State private var willMoveToNextScreen = false
    @State var isNavigationBarHidden: Bool = true
    
    var body: some View {
        NavigationView {
            
            VStack(alignment: .center) {
                Color.white
                Image("ico-gps")
                    .offset(x: 0, y: -230)
                Text("Habilite a sua localização")
                    .multilineTextAlignment(.center)
                    .offset(x: 0, y: -250)
                    .font(.system(size: 25))
                
                Text("Sua localização é necessária para validar a  ativação dos dispositivos Group Link")
                    .multilineTextAlignment(.center)
                    .offset(x: 0, y: -220)
                
                NavigationLink(destination: LoginScreen(), isActive: $willMoveToNextScreen) {
                    LocationButton((.currentLocation),action: {
                        viewModel.requestAlwaysAutorization()
                        self.willMoveToNextScreen = true
                    })
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .labelStyle(.titleOnly)
                    .padding(.bottom, 40)
                    
                }
                .navigationBarTitle("")
                .navigationBarHidden(self.isNavigationBarHidden)
                .onAppear() {
                    self.isNavigationBarHidden = true
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

final class ContentViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -23.606852, longitude: -46.686554), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
    
    let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func requestAlwaysAutorization() {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let lastestLocation = locations.first else {
            return
        }
        
        DispatchQueue.main.async {
            self.region = MKCoordinateRegion(center: lastestLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
}

struct LoginView : View {
    
    @State private var email = ""
    @State private var senha = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Entre com sua conta  Group Link™")
                    .offset(x: -70, y: -150)
                    .font(.system(size: 25))
                    .padding()
                TextField("email", text: $email)
                    .padding()
                    .frame(width: 350, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .offset(x: -10, y: -150)
                SecureField("senha", text: $senha)
                    .padding()
                    .frame(width: 350, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .offset(x: -10, y: -150)
                Link("esqueceu sua senha?",
                        destination: URL(string:
                                            "https://www.linkedin.com/in/oswaldo-crispim/")!)
                    .padding()
                    .offset(x: 60, y: -150)
                Button("entrar") {
                    
                }
                .foregroundColor(.white)
                .frame(width: 350, height: 50)
                .background(Color(hue: 0.592, saturation: 1.0, brightness: 1.0))
                .cornerRadius(40)
                .offset(x: -10, y: -150)
                
            }
        }
    }
}
