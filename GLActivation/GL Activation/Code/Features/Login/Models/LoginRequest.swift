
import Foundation

struct LoginRequest: Encodable {
    let email: String
    let password: String
    let passcode: String
}
