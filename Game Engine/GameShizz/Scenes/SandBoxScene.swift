import MetalKit

var debugCamera = DebugCamera()
// 노드
class SandBoxScene: Scene {
    
    // SceneManager init때 호출됨
    override func buildScene() {
        // 씬을 생성하고 자식들도 생성하고 자식들을 배치할때 사용
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
        // 자식들을 == (point (gameObjct, Node)) 컨트롤 하고싶을때 추가로직을 사용함
        
        /*for child in self.children {
            child.rotation.z += 0.02
        }*/
        
        // 즉각 Scene호출 혹은 없으면 Node로 호출됨
        super.update(deltaTime: deltaTime)
    }
}
