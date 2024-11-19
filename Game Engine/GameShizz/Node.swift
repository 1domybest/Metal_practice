import MetalKit

class Node {
    var position: SIMD3<Float> = SIMD3(repeating: 0)
    var scale: SIMD3<Float> = SIMD3(repeating: 1)
    var rotation: SIMD3<Float> = SIMD3(repeating: 0)
    
    var modelMatrix: matrix_float4x4 {
        var modelMatrix = matrix_identity_float4x4
        modelMatrix.translate(direction: position)
        modelMatrix.scale(axis: scale)
        modelMatrix.rotate(angle: rotation.x, axis: X_AXIS)
        modelMatrix.rotate(angle: rotation.y, axis: Y_AXIS)
        modelMatrix.rotate(angle: rotation.z, axis: Z_AXIS)
        return modelMatrix
    }
    
    var children:[Node] = []
    
    func addChildren(_ chiild: Node) {
        // childe = (Pointer == GameObject)
        children.append(chiild)
    }
    
    func update(deltaTime: Float) {
        // childe = (Pointer == GameObject)
        // 여기서의 child 는 GameObject
        for child in children {
            // 이 함수를 실행시킨 SandBox에서 좌표를 수정한후 수정한 죄표를 토대로
            // GameObject에서 메트릭스 업데이트 [단 이 메트릭스의 연산은 Node에서 계산됨]
            child.update(deltaTime: deltaTime)
        }
    }
    
    func render(renderCommandEncoder: MTLRenderCommandEncoder) {
        for child in children {
            child.render(renderCommandEncoder: renderCommandEncoder)
        }
        if let renderable = self as? Renderable {
            renderable.doRender(renderCommandEncoder: renderCommandEncoder)
        }
    }
}
