//
//  ViewController.swift
//  ARDicee
//
//  Created by FF2 on 10/31/21.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
        let sphere = SCNSphere(radius: 0.2)
        
        
        let material = SCNMaterial()
        //material.diffuse.contents = UIColor.red
        material.diffuse.contents = UIImage(named: "art.scnassets/moon.jpg")
        sphere.materials = [material]
        let node = SCNNode()
        node.position = SCNVector3(0, 0.1, -0.5)
        node.geometry = sphere
        sceneView.scene.rootNode.addChildNode(node)
        sceneView.autoenablesDefaultLighting = true
        /*
        // Create a new scene
        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        // Set the scene to the view
        sceneView.scene = scene
        */
        /*
        //let diceScene = SCNScene(named: "art.scnassets/diceCollada.scn")!
        //if let diceNode = diceScene.rootNode.childNode(withName: "Dice", recursively: true) {
        let diceScene = SCNScene(named: "art.scnassets/ship.scn")!
        if let diceNode = diceScene.rootNode.childNode(withName: "ship", recursively: true) {
            diceNode.position = SCNVector3(0, 0.1, -0.1)
            sceneView.scene.rootNode.addChildNode(diceNode)
        }*/
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

}
