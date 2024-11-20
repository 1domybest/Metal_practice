import MetalKit

enum SceneTypes {
    case Sandbox
}

class SceneManager {
    
    private static var _currentScene: Scene!
    
    public static func Initialze(_ sceneType: SceneTypes) {
        SetScene(sceneType)
    }
    
    public static func SetScene(_ sceneType: SceneTypes) {
        switch sceneType {
        case .Sandbox:
            _currentScene = SandBoxScene()
        }
    }
    
    public static func TickScene(renderCommandEncoder: MTLRenderCommandEncoder, deltaTime: Float) {
        // 카메라 위치 업데이트
        _currentScene.updateCamera(deltaTime: deltaTime)
        
        // 오브젝트 위치 업데이트
        // SandBox -> Scene -> Node -> GameObject
        _currentScene.update(deltaTime: deltaTime)
        
        // 오브젝트 렌더링
        // SandBox -> Scene -> Node -> GameObject.doRender()
        _currentScene.render(renderCommandEncoder: renderCommandEncoder)
    }
}
