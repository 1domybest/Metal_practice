import MetalKit
import Foundation

enum VertexShaderTypes {
    case Basic
    case Instanced
}

enum FragmentShaderTypes {
    case Basic
}

class ShaderLibrary {
    public static var DefaultLibrary: MTLLibrary!
    private static var vertexShaders: [VertexShaderTypes: Shader] = [:]
    private static var fragmentShaders: [FragmentShaderTypes: Shader] = [:]
    
    public static func Initialize() {
        DefaultLibrary = Engine.Device.makeDefaultLibrary()
        createDefaultShaders()
    }
    
    public static func createDefaultShaders() {
        // Vertex Shader
        vertexShaders.updateValue(Basic_VertexShader(), forKey: .Basic)
        vertexShaders.updateValue(Instanced_VertexShader(), forKey: .Instanced)
        
        // Fragment Shader
        fragmentShaders.updateValue(Basic_FragmentShader(), forKey: .Basic)
    }
    
    public static func Vertex(_ vertexShaderType: VertexShaderTypes) -> MTLFunction {
        return vertexShaders[vertexShaderType]!.function
    }
    
    public static func Fragment(_ fragmentShaderTypes: FragmentShaderTypes) -> MTLFunction {
        return fragmentShaders[fragmentShaderTypes]!.function
    }
}

protocol Shader {
    var name: String { get }
    var functionName: String { get }
    var function: MTLFunction! { get }
}


public struct Basic_VertexShader: Shader {
    var name: String = "Basic Vertex Shader"
    
    var functionName: String = "basic_vertex_shader"
    
    var function: MTLFunction!
    
    init() {
        function = ShaderLibrary.DefaultLibrary.makeFunction(name: functionName)
        function?.label = name
    }
}

public struct Instanced_VertexShader: Shader {
    var name: String = "Instanced Vertex Shader"
    
    var functionName: String = "instanced_vertex_shader"
    
    var function: MTLFunction!
    
    init() {
        function = ShaderLibrary.DefaultLibrary.makeFunction(name: functionName)
        function?.label = name
    }
}


public struct Basic_FragmentShader: Shader {
    var name: String = "Basic Fragment Shader"
    
    var functionName: String = "basic_fragment_shader"
    
    var function: MTLFunction!
    
    init() {
        function = ShaderLibrary.DefaultLibrary.makeFunction(name: functionName)
        function?.label = name
    }
}
