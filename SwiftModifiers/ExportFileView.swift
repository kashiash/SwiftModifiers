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
    @State private var exportImage: PNGDocument?
    
    var body: some View {
     
        
        Button("Export documents") {
            if let image = FileImage(named: "LordVader"){
                exportImage = PNGDocument(image: image)
                exportAssetImage.toggle()

            }
                    }
        .fileExporter(isPresented: $exportAssetImage, document: exportImage, contentType: .png) { result in
            switch result {
                case .failure(let error):
                    print("Error \(error.localizedDescription)")
                case .success(let file):
                print("Saved \(file) succesfully")
            }
        }
    
    }
    
    /// - Creating document file
    ///  - version iOS and macOs
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
        static var readableContentTypes: [UTType] {[.png]}
        
        init(configuration: ReadConfiguration) throws {
            guard let pngData = configuration.file.regularFileContents, let pngImage = FileImage(data: pngData) else {
                throw CocoaError(.fileReadUnknown)
            }
            image = pngImage
        }
        
        func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
            #if os(iOS)
            guard let pngData = image.pngData() else {
                return .init()
            }
            #else
            guard let pngData = image.tiffRepresentation else {
                return .init()
            }
            #endif
            return .init(regularFileWithContents: pngData)
        }
    }
}

struct ExportFileView_Previews: PreviewProvider {
    static var previews: some View {
        ExportFileView()
    }
}
