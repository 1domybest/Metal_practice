import MetalKit

class GameObject: Node{
    
    var modelContants = ModelConstants()
    
    var mesh: Mesh!
    
    init(meshType: MeshTypes) {
        self.mesh = MeshLibrary.Mesh(meshType)
    }

    
    override func update(deltaTime: Float) {
        updateModelConstants()
    }
    
    private func updateModelConstants() {
        modelContants.modelMatrix = self.modelMatrix
    }
}

extension GameObject: Renderable {
    func doRender(renderCommandEncoder: MTLRenderCommandEncoder) {
                renderCommandEncoder.setVertexBytes(&modelContants, length: ModelConstants.stride() , index: 1)
                renderCommandEncoder.setRenderPipelineState(RenderPiplineStateLibrary.PiplineState(.Basic))
                
                renderCommandEncoder.setVertexBuffer(mesh.vertexBuffer,
                                                      offset: 0,
                                                      index: 0)
                
                renderCommandEncoder.drawPrimitives(type: .triangle,
                                                     vertexStart: 0,
                                                    vertexCount: mesh.vertexCount)
    }
}
