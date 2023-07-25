
import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var passcode: String = ""
    
    func login() {
        LoginAction(
            parameters: LoginRequest(
                email: email,
                password: password,
                passcode: passcode
            )
        ).call { response in
            print("Access token", response.data.access_token)
        }
    }
}
