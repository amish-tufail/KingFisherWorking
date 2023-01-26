//
//  ContentView.swift
//  KingFisherWorking
//
//  Created by Amish Tufail on 26/01/2023.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    var body: some View {
        VStack(spacing: 10.0) {
            // 1. KFImage
            KFImage(URL(string: "https://picsum.photos/200"))
            
            // 2. KFImage.url
            // 3. Image Processor
            KFImage.url(URL(string: "https://picsum.photos/200"))
                .setProcessor(ResizingImageProcessor(referenceSize: .init(width: 100, height: 100)))
                .setProcessor(RoundCornerImageProcessor(cornerRadius: 12.0))
            
            // 4. On Progress > Tracks the current progess of the download
            // 5. onSuccess and onFailure
            KFImage.url(URL(string: "https://picsum.photos/200"))
                .onProgress { recieved, total in
                    print("\(recieved) - \(total)")
                }
                .onSuccess { data in
                    print("Success")
                }
                .onFailure { data in
                    print("Failure")
                }
            
            // 6. Cache and Loading Option
            KFImage.url(URL(string: "https://picsum.photos/200"))
                .loadDiskFileSynchronously()
//                . different cache methods
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
