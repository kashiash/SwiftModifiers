//
//  ImportFileView.swift
//  SwiftModifiers
//
//  Created by Jacek Kosiński G on 02/02/2023.
//

import SwiftUI
import QuickLook

struct ImportFileView: View {
    @State private var pickFile: Bool = false
    @State private var fileURL: URL?
    
    var body: some View {
       
        Button("Pick file"){
            pickFile.toggle()
        }
        .fileImporter(isPresented: $pickFile, allowedContentTypes: [.pdf,.mp3,.heic]) { result in
            
            switch result {
            case .success(let success):
                // - File URL
                fileURL = success.absoluteURL
               
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }.quickLookPreview($fileURL)
    }
}

struct ImportFileView_Previews: PreviewProvider {
    static var previews: some View {
        ImportFileView()
    }
}
