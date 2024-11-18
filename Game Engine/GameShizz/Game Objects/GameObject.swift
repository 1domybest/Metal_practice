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

                renderCommandEncoder.setRenderPipelineState(RenderPiplineStateLibrary.PiplineState(.Basic))
                
                // 기본 모양을 위한 버텍스
                renderCommandEncoder.setVertexBuffer(mesh.vertexBuffer,
                                                      offset: 0,
                                                      index: 0)
        
                // 움직임을 위한 메트릭스 버텍스
                renderCommandEncoder.setVertexBytes(&modelContants, length: ModelConstants.stride() , index: 1)
                
                
                renderCommandEncoder.drawPrimitives(type: .triangle,
                                                     vertexStart: 0,
                                                    vertexCount: mesh.vertexCount)
    }
}
