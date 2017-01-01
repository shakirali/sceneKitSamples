# Earth with clouds
In this sample I display a globe with clouds around it.   
**Note** I have used code and images from the WWDC 2013 - SceneKit session.

I have implemented the example using playground. I have also implemented this in an App to In this document I will highlight important parts of the code.

## Create the screen view
SceneView is a subclass of UIView and it can display a scene. We first create the sceneView and then add a scene to it.
```swift
var sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
var scene = SCNScene()
sceneView.scene = scene
sceneView.backgroundColor = UIColor.black
```

## Create the earth node
We create a sphere for the earth node, set its pivot and position in the scene.
```swift
let earthNode = SCNNode()
earthNode.geometry = SCNSphere(radius: 5)
earthNode.opacity = 1.0
earthNode.position = SCNVector3(0, 0, 0)
let transform3D = CATransform3DMakeRotation(CGFloat(M_PI * 0.1), 1, 0, 0)
earthNode.pivot = SCNMatrix4.makeSCNMatrix4(from: transform3D)

scene.rootNode.addChildNode(earthNode)
```

## Create the cloud node
We crate a sphere for the cloud node. The radius of cloud node is little bit larger than the earth node as cloud node will be covering the globe.
```swift
let cloudNode = SCNNode()
cloudNode.geometry = SCNSphere(radius: 5.7)
cloudNode.opacity = 0.9
cloudNode.geometry?.firstMaterial?.transparent.contents = UIImage(named: "cloudsTransparency")
cloudNode.geometry?.firstMaterial?.transparencyMode = .rgbZero
cloudNode.geometry?.firstMaterial?.transparency = 1.0
```

## Add cloud node to the earth node.
```swift
earthNode.addChildNode(cloudNode)
```
## Set the diffuse property of the earth node
```swift
earthNode.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "earthDiffuse.jpg")
```

## Set the rotation animation on the earth node
```swift
var rotation = CABasicAnimation(keyPath: "rotation")
rotation.duration = 40.0
rotation.repeatCount = FLT_MAX
rotation.toValue = NSValue(scnVector4: SCNVector4(x:0, y: 1, z: 0, w: Float(M_PI * 2)))
earthNode.addAnimation(rotation, forKey: nil)
```

## Set the rotation animation on the cloud node
```swift
rotation.duration = 100.0
cloudNode.addAnimation(rotation, forKey: nil)
```
