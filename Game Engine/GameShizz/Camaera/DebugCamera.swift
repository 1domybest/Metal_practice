import simd

class DebugCamera: Camera {
    var cameraType: CameraTypes = .Debug
    
    var position: SIMD3<Float> = SIMD3<Float>(repeating: 0)
    
    var projectionMatrix: matrix_float4x4 {
        return matrix_float4x4.perspective(degreesFov: 45,
                                           aspectRatio: Renderer.AspectRatio,
                                           near: 0.1,
                                           far: 1000)
    }
    
    func update(deltaTime: Float) {
        if Keyboard.IsKyPressed(.leftArrow) {
            self.position.x -= deltaTime
        }
        
        if Keyboard.IsKyPressed(.rightArrow) {
            self.position.x += deltaTime
        }
        
        if Keyboard.IsKyPressed(.upArrow) {
            self.position.y += deltaTime
        }
        
        if Keyboard.IsKyPressed(.downArrow) {
            self.position.y -= deltaTime
        }
    }
}
