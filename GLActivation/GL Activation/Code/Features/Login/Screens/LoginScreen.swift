

import SwiftUI


struct LoginScreen: View {
    
    @ObservedObject var viewModel: LoginViewModel = LoginViewModel()
    
    var body: some View {
        VStack {
            
            Spacer()
            
            VStack {
                Text("Entre com sua conta  Group Link™")
                    .offset(x: -70, y: -150)
                    .font(.system(size: 25))
                TextField(
                    "email".localized,
                    text: $viewModel.email
                )
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding(.top, -120)
                
                Divider()
                    .padding(.top, -100)
                
                SecureField(
                    "senha".localized,
                    text: $viewModel.password
                )
                .padding(.top, -80)
                
                Divider()
                    .padding(.top, -60)
            }
            
            Spacer()
            
            Link("esqueceu sua senha?",
                    destination: URL(string:
                                        "https://www.linkedin.com/in/oswaldo-crispim/")!)
                .padding()
                .offset(x: 85, y: -310)
            
            Button(
                action: viewModel.login,
                label: {
                    Text("entrar".localized)
                        .font(.system(size: 24, weight: .bold, design: .default))
                        .frame(maxWidth: .infinity, maxHeight: 60)
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .cornerRadius(30)
                        .padding(.top, -300)
                }
            )
        }
        .padding(30)
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
