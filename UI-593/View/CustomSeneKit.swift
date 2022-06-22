//
//  CustomSeneKit.swift
//  UI-593
//
//  Created by nyannyan0328 on 2022/06/22.
//

import SwiftUI
import SceneKit

struct CustomSeneKit: UIViewRepresentable {
    
    @Binding var scene : SCNScene?
    var isTopPotition : Bool = false
   
    func makeUIView(context: Context) -> SCNView {
        let view = SCNView()
        view.scene = scene
        view.backgroundColor = .clear
        view.isJitteringEnabled = false
        view.antialiasingMode = .multisampling4X
        view.allowsCameraControl = false
        view.autoenablesDefaultLighting = true
        
        
        return view
        
    }
    func updateUIView(_ uiView: SCNView, context: Context) {
        
        uiView.scene = scene
        uiView.pointOfView?.eulerAngles.x = -0.3
        uiView.scene?.rootNode.eulerAngles.x = 2.3
        
        if isTopPotition{
            
            uiView.scene?.rootNode.childNode(withName: "Closed_Box", recursively: true)?.isHidden = true
            
        }
        else{
            
            uiView.scene?.rootNode.childNode(withName: "Cover", recursively: true)?.isHidden = true
            
            
            
        }
    }
}

struct CustomSeneKit_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
