//
//  NavigationDestinationView.swift
//  SwiftModifiers
//
//  Created by Jacek Kosiński G on 02/02/2023.
//

import SwiftUI
import StoreKit

struct NavigationDestinationView: View {
    @Environment(\.requestReview) var requestReview
    
    @ State private var pushNewViewX = false
    var body: some View {
        NavigationStack{
            Button("Push View"){
                pushNewViewX.toggle()
            }
            .navigationDestination(isPresented: $pushNewViewX){
                Button("Request Review"){
                    requestReview()
                }
            }
        }
    }
}

struct NavigationDestinationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationDestinationView()
    }
}
