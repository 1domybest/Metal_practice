import Foundation
import MetalKit

enum VertexDescriptorTypes {
    case Basic
}

class VertexDescriptorLibrary {
    private static var vertexDescriptors: [VertexDescriptorTypes: VertexDescriptor] = [:]
    
    public static func Initialize() {
        createDefaultVertexDescriptor()
    }
    
    private static func createDefaultVertexDescriptor() {
        vertexDescriptors.updateValue(Basic_VertexDescriptor(), forKey: .Basic)
    }
    
    public static func Descriptor(_ vertexDescriptor: VertexDescriptorTypes) -> MTLVertexDescriptor {
        return vertexDescriptors[vertexDescriptor]!.vertexDescriptor
    }
}

protocol VertexDescriptor {
    var name: String { get }
    var vertexDescriptor: MTLVertexDescriptor! { get }
}

public struct Basic_VertexDescriptor: VertexDescriptor {
    var name: String = "Basic Vertex Descriptor"
    
    var vertexDescriptor: MTLVertexDescriptor!
    
    init() {
        vertexDescriptor = MTLVertexDescriptor()
        
        // Position
        vertexDescriptor?.attributes[0].format = .float3
        vertexDescriptor?.attributes[0].bufferIndex = 0
        vertexDescriptor?.attributes[0].offset = 0
        
        // Color
        vertexDescriptor?.attributes[1].format = .float4
        vertexDescriptor?.attributes[1].bufferIndex = 0
        vertexDescriptor?.attributes[1].offset = SIMD3.size()
        
        vertexDescriptor?.layouts[0].stride = Vertex.stride()
    }
}
