//
//  SwiftUIView.swift
//  SwiftModifiers
//
//  Created by Jacek Kosiński G on 02/02/2023.
//

import SwiftUI

struct HideKeyboardExampleView: View {
    @State private var text: String = ""
    var body: some View {
        ScrollView(.vertical,showsIndicators:  false){
            VStack{
                TextField("Type Here", text : $text)
                    .textFieldStyle(.roundedBorder)
            }
            .padding()
        }
        .scrollDismissesKeyboard(.interactively)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        HideKeyboardExampleView()
    }
}
