
import Foundation

struct LoginResponse: Decodable {
    let data: AccessToken
}


struct AccessToken: Decodable {
    let access_token: String
}
