import MetalKit

enum DepthStencilStateTypes {
    case Less
}

class DepthStencilStateLibrary {
    private static var _depthStencilState: [DepthStencilStateTypes: DepthStencilState] = [:]
    
    public static func Initialize() {
        createDefaultDepthStebcukStates()
    }
    
    private static func createDefaultDepthStebcukStates() {
        _depthStencilState.updateValue(Less_DepthStencilState(), forKey: .Less)
    }
    
    public static func DepthStencilState(_ depthStencilStateType: DepthStencilStateTypes) -> MTLDepthStencilState {
        return _depthStencilState[depthStencilStateType]!.depthStencilState
    }
    
    
}

protocol DepthStencilState {
    var depthStencilState: MTLDepthStencilState! { get }
}

class Less_DepthStencilState: DepthStencilState {
    
    var depthStencilState: MTLDepthStencilState!
    
    init() {
        let depthStencilDescriptor = MTLDepthStencilDescriptor()
        depthStencilDescriptor.isDepthWriteEnabled = true
        depthStencilDescriptor.depthCompareFunction = .less
        depthStencilState = Engine.Device.makeDepthStencilState(descriptor: depthStencilDescriptor)
        
    }
}
