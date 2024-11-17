import MetalKit

class GameObject: Node{
    var mesh: Mesh!
    
    init(meshType: MeshTypes) {
        self.mesh = MeshLibrary.Mesh(meshType)
    }
}

extension GameObject: Renderable {
    func doRender(renderCommandEncoder: MTLRenderCommandEncoder) {
                renderCommandEncoder.setRenderPipelineState(RenderPiplineStateLibrary.PiplineState(.Basic))
                
                renderCommandEncoder.setVertexBuffer(mesh.vertexBuffer,
                                                      offset: 0,
                                                      index: 0)
                
                renderCommandEncoder.drawPrimitives(type: .triangle,
                                                     vertexStart: 0,
                                                    vertexCount: mesh.vertexCount)
    }
}
