//
//  NavigationDestinationView.swift
//  SwiftModifiers
//
//  Created by Jacek Kosiński G on 02/02/2023.
//

import SwiftUI

struct NavigationDestinationView: View {
    @ State private var pushNewViewX = false
    var body: some View {
        NavigationStack{
            Button("Push View"){
                pushNewViewX.toggle()
            }
            .navigationDestination(isPresented: $pushNewViewX){
                Text("New View")
                Text("After new View")
            }
        }
    }
}

struct NavigationDestinationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationDestinationView()
    }
}
