import MetalKit

class GameView: MTKView {
    
    var renderer: Renderer!
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        
        self.device = MTLCreateSystemDefaultDevice()
        
        // Metal 필수요소 초기화
        Engine.Ignite(device: self.device!)
        
        self.clearColor = Preferences.clearColor
        
        self.colorPixelFormat = Preferences.MainPixelFormat

        self.renderer = Renderer()
        
        self.delegate = renderer
    
    }
    
    // Mouse Input
    
    // Keyboard Input
    
}
