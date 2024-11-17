import Foundation
import MetalKit

class Engine {
    
    public static var Device: MTLDevice!
    public static var commandQueue: MTLCommandQueue!
    
    public static func Ignite(device: MTLDevice) {
        self.Device = device
        self.commandQueue = device.makeCommandQueue()
        
        ShaderLibrary.Initialize()
        
        VertexDescriptorLibrary.Initialize()
        
        RenderPiplineDescriptorLibrary.Initialize()
        
        RenderPiplineStateLibrary.Initailize()
        
        MeshLibrary.Initialize()
    }
    
}
