//
//  RenderPiplineStatesLibrary.swift
//  Game Engine
//
//  Created by 온석태 on 11/17/24.
//

import Foundation
import MetalKit
enum RenderPiplineStateTypes {
    case Basic
}

class RenderPiplineStateLibrary {
    private static var renderPiplineStates: [RenderPiplineStateTypes: RenderPiplineState] = [:]
    
    public static func Initailize() {
        createDefaultRenderPipelineStates()
    }
    
    private static func createDefaultRenderPipelineStates() {
        renderPiplineStates.updateValue(Basic_RednerPiplineState(), forKey: .Basic)
    }
    
    public static func PiplineState(_ renderPiplineStateTypes: RenderPiplineStateTypes) -> MTLRenderPipelineState {
        return (renderPiplineStates[renderPiplineStateTypes]?.renderPiplineState)!
    }
}


protocol RenderPiplineState {
    var name:String { get }
    var renderPiplineState: MTLRenderPipelineState! { get }
}

public struct Basic_RednerPiplineState: RenderPiplineState {
    var name: String = "Basic Redner Pipline State"
    
    var renderPiplineState: MTLRenderPipelineState!
    
    init() {
        do {
            renderPiplineState = try Engine.Device.makeRenderPipelineState(descriptor: RenderPiplineDescriptorLibrary.Descriptor(.Basic))
        } catch let error as NSError {
            print("ERRO::CREATE::RENDER_PIPLINE_STATE::__\(name)__::\(error)")
        }
    }
    
}
