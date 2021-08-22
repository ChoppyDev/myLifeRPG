//
//  ContentView.swift
//  MyLifeRPG
//
//  Created by Nicolas Klein on 20/08/2021.
//

import SwiftUI
import FirebaseAuth


let palette =  ColorPalette()

class AppViewModel: ObservableObject {
    let auth = Auth.auth()
    
    @Published var signedIn = false
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self ]result, error in
            guard result != nil, error == nil else {
                return
            }
            print("Login success")
            
            DispatchQueue.main.async {
                self?.signedIn = true
            }
            
            // Success
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
            // Success
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
            Text("MyLifeRPG")
            Text("Login")
                .bold()
            TextField("email", text: $username)
                .padding()
                .background(palette.lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom,20)
                .autocapitalization(.none)
            SecureField("Password", text: $password).padding()
                .background(palette.lightGreyColor)
                .padding( .bottom, 20).cornerRadius(5.0)
            Button(action: {
                viewModel.signIn(email: username, password: password)
                
            }) {
                Text("Sign in")
                
            }
            NavigationLink("Create an account", destination: SignupView()).padding(.top)
        }
    }
    
}

struct SignOutView: View {
    var body: some View {
        TabView {
            NavigationView {
                DashboardView()
            }.tabItem {
                Image(systemName: "gauge")
            }
            
            NavigationView {
                QuestView()
            }.tabItem {
                Image(systemName: "list.bullet")
            }
            NavigationView {
                SettingsView()
            }.tabItem {
                Image(systemName: "gear")
            }
        }
    }
}


/**
 Dashboard view
 */
struct DashboardView: View {
    var body: some View {
        ScrollView {
            Text("Hello user")
        }
    }
}

struct SettingsView: View {
    @EnvironmentObject var viewModel: AppViewModel //todo : Try to make it global
    
    var body: some View {
        ScrollView {
            Text("Options")
            Button(action: {
                viewModel.signOut()
            }) {
                Text("Sign out")
            }
        }
    }
}

/**
 Quest view
 */
struct QuestView: View {
    var body: some View {
        ScrollView {
            Text("coucou")
            Text("coucou")
            Text("coucou")
            Text("coucou")
            Text("coucou")
            Text("coucou")
            Text("coucou")
            Text("coucou")
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
                .background(palette.lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom,20)
                .autocapitalization(.none)
            SecureField("Password", text: $password).padding()
                .background(palette.lightGreyColor)
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
