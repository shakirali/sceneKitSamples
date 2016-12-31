import SceneKit

extension SCNNode {
    static func makeEarthNode(position: SCNVector3, pivot: SCNMatrix4) -> SCNNode      {
        let node = SCNNode()
        node.pivot = pivot
        node.position = position
        node.geometry = SCNSphere(radius: 6.2)
        node.opacity = 1.0
        return node
    }
    
    static func makeCloudsNode() -> SCNNode {
        let node = SCNNode()
        node.geometry = SCNSphere(radius: 6.9)
        node.opacity = 0.9
        node.geometry?.firstMaterial?.transparent.contents = UIImage(named: "cloudsTransparency")
        node.geometry?.firstMaterial?.transparencyMode = .rgbZero
        node.geometry?.firstMaterial?.transparency = 1.0
        return node
    }
}
