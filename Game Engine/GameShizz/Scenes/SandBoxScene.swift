import MetalKit

var debugCamera = DebugCamera()
// 노드
class SandBoxScene: Scene {
    
    // SceneManager init때 호출됨
    override func buildScene() {
        // 씬을 생성하고 자식들도 생성하고 자식들을 배치할때 사용
        addCamera(debugCamera)
        debugCamera.position.z = 100
        addCubes()
    }
    
    var cubeCollection: CubeCollection!
    
    func addCubes() {
        cubeCollection = CubeCollection(cubesWide: 20, cubesHigh: 20, cubesBack: 20)
        
        addChild(cubeCollection)
    }
    
    override func update(deltaTime: Float) {
        cubeCollection.rotation.z += deltaTime
    
        super.update(deltaTime: deltaTime)
    }
}
