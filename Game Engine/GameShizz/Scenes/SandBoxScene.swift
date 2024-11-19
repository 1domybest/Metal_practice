import MetalKit

var debugCamera = DebugCamera()
// 노드
class SandBoxScene: Scene {
    
    // SceneManager init때 호출됨
    override func buildScene() {
        addCamera(debugCamera)
        let count: Int = 5
        for y in -count..<count {
            for x in -count..<count {
                // Pointer < GameObject < Node
                // Node를 Node에 등록
                
                let pointer = Pointer(camera: debugCamera)
                pointer.position.y = Float(Float(y) + 0.5) / Float(count)
                pointer.position.x = Float(Float(x) + 0.5) / Float(count)
                pointer.scale = SIMD3<Float>(repeating: 0.1)
                // Node
                addChildren(pointer)
            }
        }
    }
    
    // 렌더링중에 Renderer -> SceneManager -> 여기로 호출
    override func update(deltaTime: Float) {
        // 각 Node == 게임오브젝트 의 방향을 지정
        // Node.update -> GameObject.update
        // 단 여기에서는 Node내에있는 변수중 rotation을 변경함
        /*for child in self.children {
            child.rotation.z += 0.02
        }*/
        super.update(deltaTime: deltaTime)
    }
}
