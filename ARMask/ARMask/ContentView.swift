//
//  ContentView.swift
//  ARMask
//
//  Created by Pablo Álvarez Álvarez on 24/11/23.
//

import SwiftUI
import RealityKit
import ARKit

struct ContentView : View {
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        let faceScene = try! ARTacticalMask.loadEscena()
        arView.scene.anchors.append(faceScene)
        
        // Add the box anchor to the scene
        let arConfig = ARFaceTrackingConfiguration()
        arView.session.run(arConfig)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
