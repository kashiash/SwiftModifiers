//
//  ContentView.swift
//  SwiftModifiers
//
//  Created by Jacek Kosiński G on 02/02/2023.
//

import SwiftUI

struct ContentView: View {
    @ State private var pushNewView = false
    var body: some View {
        NavigationStack{
            Button("Push View"){
                pushNewView.toggle()
            }
            .navigationDestination(isPresented: $pushNewView){
               Text("New View")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
