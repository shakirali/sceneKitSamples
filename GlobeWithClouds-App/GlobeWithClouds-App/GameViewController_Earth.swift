import SceneKit

extension GameViewController {
    func setupEarthNode(for scene: SCNScene) {
        let position = SCNVector3(0, 0, -2)
        let transform3D = CATransform3DMakeRotation(CGFloat(M_PI * 0.1), 1, 0, 0)
        let matrix = SCNMatrix4.makeSCNMatrix4(from: transform3D)
        self.earthNode = SCNNode.makeEarthNode(position: position, pivot: matrix)
        
        let rotation = self.makeRotationAnimation(with: 40.0)
        earthNode.addAnimation(rotation, forKey: nil)
        
        scene.rootNode.addChildNode(self.earthNode)
    }
    
    func makeRotationAnimation(with duration: CFTimeInterval) -> CABasicAnimation {
        
        let rotation = CABasicAnimation(keyPath: "rotation")
        rotation.duration = duration
        rotation.repeatCount = FLT_MAX
        rotation.toValue = NSValue(scnVector4: SCNVector4(x:0, y: 1, z: 0, w: Float(M_PI * 2)))
        return rotation
    }
    
    @IBAction func diffuseValueChanged(sender: UISwitch) {
        let diffuse = self.earthNode.geometry?.firstMaterial?.diffuse
        if sender.isOn {
            diffuse?.contents = UIImage(named: "earthDiffuse")
        } else {
           diffuse?.contents = nil
        }
    }
    
    @IBAction func ambientValueChanged(sender: UISwitch) {
        let ambient = self.earthNode.geometry?.firstMaterial?.ambient
        if sender.isOn {
            ambient?.contents = UIImage(named: "earthDiffuse")
            ambient?.intensity = 1
        } else {
            ambient?.contents = nil
            ambient?.intensity = 0
        }
    }
    
    @IBAction func specularValueChanged(sender: UISwitch) {
        if sender.isOn {
        
                self.earthNode.geometry?.firstMaterial?.shininess = 0.1
                self.earthNode.geometry?.firstMaterial?.specular.contents = UIImage(named: "earthSpecular")
        } else {
            self.earthNode.geometry?.firstMaterial?.shininess = 0.0
            self.earthNode.geometry?.firstMaterial?.specular.contents = nil
        }
    }
    
    @IBAction func normalValueChanged(sender: UISwitch) {
        let normal = self.earthNode.geometry?.firstMaterial?.normal
        if sender.isOn {
            normal?.contents = UIImage(named: "earthBump")
            normal?.intensity = 1.3
        } else {
            normal?.contents = nil
            normal?.intensity = 0
        }
    }
    
    @IBAction func reflectiveValueChanged(sender: UISwitch) {
        let reflective = self.earthNode.geometry?.firstMaterial?.reflective
        if sender.isOn {
            reflective?.contents = UIImage(named:"earthReflective")
            reflective?.intensity = 0.1
        } else {
            reflective?.contents = nil
            reflective?.intensity = 0.0
        }
    }
    
    @IBAction func emissiveValueChanged(sender: UISwitch) {
        let emission = self.earthNode.geometry?.firstMaterial?.emission
        if sender.isOn {
            emission?.contents = UIImage(named:"earthEmissive")
            emission?.intensity = 1.0
        } else {
            emission?.contents = nil
            emission?.intensity = 0.0
        }
    }
    
    @IBAction func applyColorValueChanged(sender: UISwitch) {
        let multiply = self.earthNode.geometry?.firstMaterial?.multiply
        if sender.isOn {
            multiply?.contents = UIColor(red: 1.0, green: 204/255.0, blue: 102/255.0, alpha: 1)
        } else {
            multiply?.contents = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
        }
    }
    
    @IBAction func cloudNodeValueChanged(sender: UISwitch) {
        if sender.isOn {
            if self.cloudNode == .none {
                self.cloudNode = SCNNode.makeCloudsNode()
            }
            let rotation = self.makeRotationAnimation(with: 200)
            self.cloudNode?.addAnimation(rotation, forKey: nil)
            self.earthNode.addChildNode(self.cloudNode!)
        } else {
            self.cloudNode?.removeAllAnimations()
            self.cloudNode?.removeFromParentNode()
        }
    }
    
}
