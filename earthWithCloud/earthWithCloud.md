# Globe with clouds
In this sample I display a globe with clouds around it.
**Note** I have used code and images from WWDC 2013 - SceneKit session.

I have demonstrate the code using Playground. In this document I will highlight important parts of the code.

## create the screen view
SceneView is a subclass of UIView and it can display a scene. We first create the sceneView and then add a scene to it.
```swift
var sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
var scene = SCNScene()
sceneView.scene = scene
sceneView.backgroundColor = UIColor.black
```

## Create an earth node
