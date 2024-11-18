import MetalKit

class SandBoxScene: Scene {
    
    
    override func buildScene() {
        for y in -5..<5 {
            for x in -5..<5 {
                let player = Player()
                player.position.y = Float(Float(y) + 0.5) / 5
                player.position.x = Float(Float(x) + 0.5) / 5
                player.scale = SIMD3<Float>(repeating: 0.1)
                addChildren(player)
            }
        }
    }
    
    override func update(deltaTime: Float) {
        for child in self.children {
            child.rotation.z += 0.02
        }
        
        super.update(deltaTime: deltaTime)
    }
}
