import MetalKit

// 노드의 집합체?
class Scene: Node {
    var cameraManager = CameraManager()
    
    var sceneConstants = SceneConstants()
    
    override init() {
        super.init()
        buildScene()
    }
    
    func buildScene() {}
    
    func addCamera(_ camera: Camera, _ isCurrentCamera: Bool = true) {
        self.cameraManager.registerCamera(camera: camera)
        if isCurrentCamera {
            self.cameraManager.setCamera(camera.cameraType)
        }
    }
    
    func updateSceneConstants() {
        sceneConstants.viewMatrix = cameraManager.currentCamera.viewMatrix
    }
    
    func updateCamera(deltaTime: Float) {
        cameraManager.update(deltaTime: deltaTime)
    }
    
    override func update(deltaTime: Float) {
        updateSceneConstants()
        // Node의 업데이트
        super.update(deltaTime: deltaTime)
    }
    
    override func render(renderCommandEncoder: any MTLRenderCommandEncoder) {
        // 신의 위치 변경
        renderCommandEncoder.setVertexBytes(&sceneConstants, length: SceneConstants.stride(), index: 1)
        
        super.render(renderCommandEncoder: renderCommandEncoder)
    }
}
