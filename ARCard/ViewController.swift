//
//  ViewController.swift
//  ARCard
//
//  Created by TokyoYoshida on 2020/08/01.
//  Copyright © 2020 TokyoMac. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {
    @IBOutlet weak var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sceneView.scene = SCNScene(named: "art.scnassets/ship.scn")!

        let configuration = ARWorldTrackingConfiguration()

        sceneView.session.run(configuration)
    }
}
