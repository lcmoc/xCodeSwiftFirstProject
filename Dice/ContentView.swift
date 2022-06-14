//
//  ContentView.swift
//  Dice
//
//  Created by Luca Mock on 14.06.22.
//

import SwiftUI

struct Dice: View {
    @State private var diceNumber = 1;
    
    func diceRoll() -> Int  {
        let randomNumber = Int.random(in: 1 ... 6)
        return randomNumber;
    }
    
    var body: some View {
        VStack(spacing: 18.0) {
            Image("dice-\(diceNumber)")
            Text("You rolled a \(diceNumber)")
                .bold()
            
            Button("Roll the dice") {
                self.diceNumber = diceRoll()
            }
            .padding()
            .border(Color.blue/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1)
            .cornerRadius(2.0)
        }
    }
}

struct Formula: View {
    @State var username: String = ""
    @State var isPrivate: Bool = true
    
    @State var notifcationsEnabled: Bool = false
    var previewOptions: Array = ["Alsways", "When Unlocked", "Never"]
    @State private var previewIndex: Int = 0
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("PROFILE")) {
                    TextField("Username", text: $username)
                    
                    Toggle(isOn: $isPrivate){
                        Text("Private Account")
                    }
                }
                
                Section(header: Text("NOTIFICATIONS")) {
                    Toggle(isOn: $notifcationsEnabled) {
                        Text("Enabled")
                    }
                    
                    Picker(selection: $previewIndex, label: Text("show previews")) {
                        ForEach(0 ..< previewOptions.count, id: \.self) {
                            Text(self.previewOptions[$0])
                        }
                    }
                }
                
                Section(header: Text("ABOUT")) {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("2.2.1")
                    }
                }
                
                Section {
                    Button("Reset all settings"){
                        // actions here
                    }
                }
            }
            .navigationBarTitle("Settings")
        }
    }
}

struct ContentView: View {

    var body: some View {
        TabView(selection: .constant(1)) {
            Dice().tabItem {
                Text("Dice")
            }.tag(1)
            Formula().tabItem { Text("Form") }.tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
