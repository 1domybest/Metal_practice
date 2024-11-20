//
//  Types.swift
//  Game Engine
//
//  Created by 온석태 on 11/17/24.
//

import Foundation
import simd

protocol sizeable {}

extension sizeable {
    static func size() -> Int {
        return MemoryLayout<Self>.size
    }
    
    static func stride() -> Int {
        return MemoryLayout<Self>.stride
    }
    
    static func size(_ count: Int) -> Int {
        return MemoryLayout<Self>.size * count
    }
    
    static func stride(_ count: Int) -> Int {
        return MemoryLayout<Self>.stride * count
    }
}

extension SIMD3<Float>: sizeable {}
extension Float: sizeable {}

struct Vertex: sizeable {
    var position: SIMD3<Float>
    var color: SIMD4<Float>
}


struct ModelConstants: sizeable {
    var modelMatrix = matrix_identity_float4x4
}


struct SceneConstants: sizeable {
    var viewMatrix = matrix_identity_float4x4
    var projectionMatrix = matrix_identity_float4x4
}


struct Material: sizeable {
    var color = SIMD4<Float>(0.8, 0.8, 0.8, 1.0)
    var useMaterialColor: Bool = false
}
