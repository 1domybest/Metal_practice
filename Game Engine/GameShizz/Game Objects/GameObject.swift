import MetalKit

class GameObject: Node{
    
    var modelContants = ModelConstants()
    private var material = Material()
    
    var mesh: Mesh!
    
    init(meshType: MeshTypes) {
        self.mesh = MeshLibrary.Mesh(meshType)
    }

    
    override func update(deltaTime: Float) {
        print("GameObject")
        updateModelConstants()
    }
    
    private func updateModelConstants() {
        modelContants.modelMatrix = self.modelMatrix
    }
}

extension GameObject: Renderable {
    func doRender(renderCommandEncoder: MTLRenderCommandEncoder) {
        
        renderCommandEncoder.setRenderPipelineState(RenderPiplineStateLibrary.PiplineState(.Basic))
        // 깊이 지정?
        renderCommandEncoder.setDepthStencilState(DepthStencilStateLibrary.DepthStencilState(.Less))
        
        // Vertex Shader
        // 움직임을 위한 메트릭스 버텍스
        renderCommandEncoder.setVertexBytes(&modelContants, length: ModelConstants.stride() , index: 2)
        
        // Fragment Shader
        renderCommandEncoder.setFragmentBytes(&material, length: Material.stride(), index: 1)
        
        mesh.drawPrimitives(renderCommandEncoder)
    }
}

// Material Properties
extension GameObject {
    public func setColor(_ color: SIMD4<Float>) {
        self.material.color = color
        self.material.useMaterialColor = true
    }
}
