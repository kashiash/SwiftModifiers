//
//  ExportFileView.swift
//  SwiftModifiers
//
//  Created by Jacek Kosiński G on 02/02/2023.
//

import SwiftUI
import UniformTypeIdentifiers

struct ExportFileView: View {
    @State private var exportAssetImage: Bool = false
    var body: some View {
        Button("Export image file"){
            exportAssetImage.toggle()
        }
        .fileExporter(isPresented: $exportAssetImage, documents: <#T##Collection#>, contentType: <#T##UTType#>, onCompletion: <#T##(Result<[URL], Error>) -> Void##(Result<[URL], Error>) -> Void##(_ result: Result<[URL], Error>) -> Void#>)
        
    }
    
    /// - Creating document file
    ///  - wersion iOS and macOs
    #if os(iOS)
    typealias FileImage = UIImage
    #else
    typealias FileImage = NSImage
    #endif
    struct PNGDocument: FileDocument{
        var image: FileImage
        
        init(image: FileImage){
            self.image = image
        }
    }
}

struct ExportFileView_Previews: PreviewProvider {
    static var previews: some View {
        ExportFileView()
    }
}
