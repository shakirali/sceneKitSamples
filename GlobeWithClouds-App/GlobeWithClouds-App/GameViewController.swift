import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {
    private let scene = SCNScene()
    var earthNode: SCNNode = SCNNode()
    var cloudNode: SCNNode?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let scnView = self.view as! SCNView
        self.setup(scnView: scnView, for: scene)
        self.setupCameraNode(for: scene)
        self.setupLights(for: scene)
        self.setupEarthNode(for: scene)
    }
    
    func setupCameraNode(for scene: SCNScene){
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 15)
        cameraNode.camera?.zFar = 500
        cameraNode.rotation = SCNVector4Make(0, 0, 1, Float(-M_PI_4*0.75))
        scene.rootNode.addChildNode(cameraNode)
    }
    
    func setupLights(for scene: SCNScene) {
        // create and add omni light to the scene
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light!.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 0, z: 10)
        scene.rootNode.addChildNode(lightNode)
        
        // create and add an ambient light to the scene
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = .ambient
        ambientLightNode.light!.color = UIColor(white: 0.3, alpha: 1.0)
        scene.rootNode.addChildNode(ambientLightNode)
    }
    
    func setup(scnView: SCNView, for scene: SCNScene) {
        scnView.scene = scene
        scnView.allowsCameraControl = false
        scnView.showsStatistics = true
        scnView.backgroundColor = UIColor.black
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }
}
