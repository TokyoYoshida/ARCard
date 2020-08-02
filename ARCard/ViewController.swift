//
//  ViewController.swift
//  ARCard
//
//  Created by TokyoYoshida on 2020/08/01.
//  Copyright © 2020 TokyoMac. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    @IBOutlet weak var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sceneView.scene = SCNScene()
        
        sceneView.autoenablesDefaultLighting = true
        
        sceneView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let configuration = ARImageTrackingConfiguration()
        
        configuration.trackingImages = ARReferenceImage.referenceImages(
        inGroupNamed: "AR Resources", bundle: nil)!

        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        sceneView.session.pause()
    }

    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        DispatchQueue.main.async {
            
            if (anchor.name == "apple_logo") {
                
                let scene = SCNScene(named: "art.scnassets/ship.scn")!
                let modelNode = (scene.rootNode.childNode(withName: "ship", recursively: false))!
                modelNode.scale = SCNVector3(x: 0.01, y: 0.01, z: 0.01)
                node.addChildNode(modelNode)
            }
        }
    }
}
