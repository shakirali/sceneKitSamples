import SceneKit

extension SCNMatrix4 {
    static func makeSCNMatrix4(from transform3D: CATransform3D) -> SCNMatrix4 {
        let matrix = SCNMatrix4(m11: Float(transform3D.m11), m12: Float(transform3D.m12), m13: Float(transform3D.m13), m14: Float(transform3D.m14), m21: Float(transform3D.m21), m22: Float(transform3D.m22), m23: Float(transform3D.m23), m24: Float(transform3D.m24), m31: Float(transform3D.m31), m32: Float(transform3D.m32), m33: Float(transform3D.m33), m34: Float(transform3D.m34), m41: Float(transform3D.m41), m42: Float(transform3D.m42), m43: Float(transform3D.m43), m44: Float(transform3D.m44))
        return matrix
    }
}
