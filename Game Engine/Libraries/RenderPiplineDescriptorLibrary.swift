//
//  RenderPiplineDescriptorLibrary.swift
//  Game Engine
//
//  Created by 온석태 on 11/17/24.
//

import Foundation
import MetalKit

enum RenderPiplineDescriptorTypes {
    case Basic
    case Instanced
}

class RenderPiplineDescriptorLibrary {
    
    private static var rednerPipelineDescriptors:[RenderPiplineDescriptorTypes : RenderPiplineDescriptor] = [:]
    
    public static func Initialize() {
        createDefaultRenderPiplineDescriptors()
    }
    
    private static func createDefaultRenderPiplineDescriptors() {
        rednerPipelineDescriptors.updateValue(Basic_RednerPiplineDescriptor(), forKey: .Basic)
        rednerPipelineDescriptors.updateValue(Instanced_RednerPiplineDescriptor(), forKey: .Instanced)
    }
    
    public static func Descriptor(_ rednerPiplineDescriptorType: RenderPiplineDescriptorTypes) -> MTLRenderPipelineDescriptor {
        return rednerPipelineDescriptors[rednerPiplineDescriptorType]!.renderPiplineDescriptor
    }
    
}

protocol RenderPiplineDescriptor {
    var name:String { get }
    var renderPiplineDescriptor: MTLRenderPipelineDescriptor! { get }
}

public struct Basic_RednerPiplineDescriptor: RenderPiplineDescriptor {
    var name: String = "Basic Redner Pipline Decriptor"
    
    var renderPiplineDescriptor: MTLRenderPipelineDescriptor!
    
    init() {
        renderPiplineDescriptor = MTLRenderPipelineDescriptor()
        renderPiplineDescriptor?.colorAttachments[0].pixelFormat = Preferences.MainPixelFormat
        renderPiplineDescriptor?.depthAttachmentPixelFormat = Preferences.MainDepthPixelFormat
        renderPiplineDescriptor?.vertexFunction = ShaderLibrary.Vertex(.Basic)
        renderPiplineDescriptor?.fragmentFunction = ShaderLibrary.Fragment(.Basic)
        renderPiplineDescriptor?.vertexDescriptor =  VertexDescriptorLibrary.Descriptor(.Basic)
    }
}


public struct Instanced_RednerPiplineDescriptor: RenderPiplineDescriptor {
    var name: String = "Instanced Redner Pipline Decriptor"
    
    var renderPiplineDescriptor: MTLRenderPipelineDescriptor!
    
    init() {
        renderPiplineDescriptor = MTLRenderPipelineDescriptor()
        renderPiplineDescriptor?.colorAttachments[0].pixelFormat = Preferences.MainPixelFormat
        renderPiplineDescriptor?.depthAttachmentPixelFormat = Preferences.MainDepthPixelFormat
        renderPiplineDescriptor?.vertexFunction = ShaderLibrary.Vertex(.Instanced)
        renderPiplineDescriptor?.fragmentFunction = ShaderLibrary.Fragment(.Basic)
        renderPiplineDescriptor?.vertexDescriptor =  VertexDescriptorLibrary.Descriptor(.Basic)
    }
}
