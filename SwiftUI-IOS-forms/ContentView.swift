//
//  ContentView.swift
//  SwiftUI-IOS-forms
//
//  Created by James Boyer on 12/27/21.
//

import SwiftUI

struct ContentView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var birthDate = Date()
    @State private var shouldSendNewsletter = false
    @State private var likeCount = 1
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Info")) {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    DatePicker("Birthdate", selection: $birthDate, displayedComponents: .date)
                }
                
                Section(header: Text("Actions")) {
                    Toggle("Send Newsletter", isOn: $shouldSendNewsletter)
                        .toggleStyle(SwitchToggleStyle(tint: .red))
                    Stepper("Number of likes", value: $likeCount, in: 1...100)
                    Text("This video has \(likeCount) likes")
                    Link("Terms of Service", destination: URL(string: "https://google.com")!)
                }
            }
            .navigationTitle("Account")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        hideKeyboard()
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.down")
                    }
                    
                    Button("Save", action: saveUser)
                }
            }
        }
        .accentColor(.red)
    }
    
    func saveUser() {
        print("User Saved")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
