import UIKit
import SceneKit
import QuartzCore
import PlaygroundSupport

/*: SceneKit Sample- Earth with Clouds
# Introduction
 In this sample I have animated globe with clouds using SceneKit.
 **Note**
This playground is based on the code and resources provided in the WWDC 2013 - SceneKit session sample code which is available for free to download. My aim is to make small samples out of that presentation.
*/

//Create SceneView
var sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
var scene = SCNScene()
sceneView.scene = scene
sceneView.backgroundColor = UIColor.black

// start a live preview of that view
PlaygroundPage.current.liveView = sceneView

// default lighting
sceneView.autoenablesDefaultLighting = true

//camera
var cameraNode = SCNNode()
cameraNode.camera = SCNCamera()
cameraNode.position = SCNVector3(x: 0, y: 0, z: 15)
scene.rootNode.addChildNode(cameraNode)

//earth node
let earthNode = SCNNode()
earthNode.geometry = SCNSphere(radius: 5)
earthNode.opacity = 1.0
earthNode.position = SCNVector3(0, 0, 0)


//let transform3D = CATransform3DMakeRotation(CGFloat(M_PI * 0.1), 1, 0, 0)
//earthNode.pivot = SCNMatrix4.makeSCNMatrix4(from: transform3D)

//cloud node
let cloudNode = SCNNode()
cloudNode.geometry = SCNSphere(radius: 5.7)
cloudNode.opacity = 0.9
cloudNode.geometry?.firstMaterial?.transparent.contents = UIImage(named: "cloudsTransparency")
cloudNode.geometry?.firstMaterial?.transparencyMode = .rgbZero
cloudNode.geometry?.firstMaterial?.transparency = 1.0


//add cloud node
earthNode.addChildNode(cloudNode)

//diffuse
earthNode.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "earthDiffuse.jpg")

//shininess
earthNode.geometry?.firstMaterial?.shininess = 0.1
earthNode.geometry?.firstMaterial?.specular.contents = UIImage(named: "earthSpecular.jpg")

//earth Bump
earthNode.geometry?.firstMaterial?.normal.contents = UIImage(named: "earthBump")
earthNode.geometry?.firstMaterial?.normal.intensity = 1.3

//emissive
earthNode.geometry?.firstMaterial?.emission.contents = UIImage(named:"earthEmissive.jpg")
earthNode.geometry?.firstMaterial?.emission.intensity = 1.0

//reflective
earthNode.geometry?.firstMaterial?.reflective.contents = UIImage(named:"earthReflective.jpg")
earthNode.geometry?.firstMaterial?.reflective.intensity = 0.1;

//uncomment this line to see different effect of the material.
//earthNode.geometry?.firstMaterial?.multiply.contents = UIColor(red: 1.0, green: 204/255.0, blue: 102/255.0, alpha: 1)

//earth node animation
var rotation = CABasicAnimation(keyPath: "rotation")
rotation.duration = 40.0
rotation.repeatCount = FLT_MAX
rotation.toValue = NSValue(scnVector4: SCNVector4(x:0, y: 1, z: 0, w: Float(M_PI * 2)))
earthNode.addAnimation(rotation, forKey: nil)

rotation.duration = 100.0
cloudNode.addAnimation(rotation, forKey: nil)


//add node to scene
scene.rootNode.addChildNode(earthNode)
