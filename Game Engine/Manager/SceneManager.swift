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
        // SandBox -> Node -> GameObject
        _currentScene.updateCamera(deltaTime: deltaTime)
        
        _currentScene.update(deltaTime: deltaTime)
        
        _currentScene.render(renderCommandEncoder: renderCommandEncoder)
    }
}
