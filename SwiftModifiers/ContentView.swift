//
//  ContentView.swift
//  SwiftModifiers
//
//  Created by Jacek Kosiński G on 02/02/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var pushNewView = false
    @State private var pushKeyboardView = false
    @State private var pushImportFileView = false
    @State private var pushExportFileView = false
    var body: some View {
        NavigationStack{
            Button("Push View"){
                pushNewView.toggle()
            }
            .navigationDestination(isPresented: $pushNewView){
               NavigationDestinationView()
            }
            Button("Hide Keyboard View"){
                pushKeyboardView.toggle()
            }
            .navigationDestination(isPresented: $pushKeyboardView){
               HideKeyboardExampleView()
            }
            Button("Import file View"){
                pushImportFileView.toggle()
            }
            .navigationDestination(isPresented: $pushImportFileView){
               ImportFileView()
            }
            
            Button("Export file View"){
                pushExportFileView.toggle()
            }
            .navigationDestination(isPresented: $pushExportFileView){
               ExportFileView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
