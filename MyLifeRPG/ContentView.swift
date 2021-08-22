//
//  ContentView.swift
//  MyLifeRPG
//
//  Created by Nicolas Klein on 20/08/2021.
//

import SwiftUI
import FirebaseAuth


let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)


class AppViewModel: ObservableObject {
    let auth = Auth.auth()
    
    @Published var signedIn = false
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self ]result, error in
            guard result != nil, error == nil else {
                return
            }
            print("sucess !!!!!!!!!!!!!!!!!!!!!!!!!!!")
            
            DispatchQueue.main.async {
                self?.signedIn = true
            }
            
            // sucess
        }
    }
    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { [weak self]result, error in
            guard result != nil, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self?.signedIn = true
            }
            // sucess
        }
        
    }
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func signOut() {
        try? auth.signOut()
        
        self.signedIn = false
    }
}

struct ContentView: View {
    
    
    @EnvironmentObject var viewModel: AppViewModel
    var body: some View {
        NavigationView {
            if viewModel.signedIn {
                
                SignOutView()
            } else {
                SignInView()
            }
        }.onAppear {
            viewModel.signedIn = viewModel.isSignedIn
        }.navigationTitle("Sign up")
    }
}

struct SignInView: View {
    @State var username: String = ""
    @State var password: String = ""
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        
        VStack {
            Text("Login")
                .bold()
            TextField("email", text: $username)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom,20)
                .autocapitalization(.none)
            SecureField("Password", text: $password).padding()
                .background(lightGreyColor)
                .padding( .bottom, 20).cornerRadius(5.0)
            Button(action: {
                viewModel.signIn(email: username, password: password)
                
            }) {
                Text("Sign in")
                
            }
            NavigationLink("create account", destination: SignupView())
            
        }
    }
    
}

struct SignOutView: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        VStack {
            Text("Hello user")
            Button(action: {
                viewModel.signOut()
            }) {
                Text("Sign out")
            }
        }
    }
}


struct SignupView: View {
    @State var username: String = ""
    @State var password: String = ""
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        
        VStack {
            Text("Register")
                .bold()
            TextField("email", text: $username)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom,20)
                .autocapitalization(.none)
            SecureField("Password", text: $password).padding()
                .background(lightGreyColor)
                .padding( .bottom, 20).cornerRadius(5.0)
            Button(action: {
                viewModel.signUp(email: username, password: password)
                
            }) {
                Text("Sign up")
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
