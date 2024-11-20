import MetalKit

class InstancedGameObject: Node {
    private var _mesh: Mesh!
    var material = Material()
    
    internal var _nodes: [Node] = []
    private var _modelConstants: [ModelConstants] = []
    private var _modelConstantBuffer: MTLBuffer!
    
    init(meshType: MeshTypes, instanceCount: Int) {
        super.init()
        
        self._mesh = MeshLibrary.Mesh(meshType)
        self._mesh.setInstanceCount(instanceCount)
        self.generateInstance(instanceCount)
        self.createBuffers(instanceCount)
    }
    
    func generateInstance(_ instanceCount: Int) {
        for _ in 0..<instanceCount {
            let node = Node()
            _nodes.append(node)
            _modelConstants.append(ModelConstants())
        }
    }
    
    func createBuffers(_ instanceCount: Int) {
        _modelConstantBuffer = Engine.Device.makeBuffer(length: ModelConstants.stride(instanceCount),
                                                   options: [])
    }
    
    private func updateModelConstants() {
        var poiter = _modelConstantBuffer.contents().bindMemory(to: ModelConstants.self, capacity: _modelConstants.count)
        for node in _nodes {
            poiter.pointee.modelMatrix = matrix_multiply(self.modelMatrix, node.modelMatrix)
            poiter = poiter.advanced(by: 1)
        }
    }
    
    override func update(deltaTime: Float) {
        self.updateModelConstants()
        super.update(deltaTime: deltaTime)
    }
}

extension InstancedGameObject: Renderable {
    func doRender(renderCommandEncoder: any MTLRenderCommandEncoder) {
        renderCommandEncoder.setRenderPipelineState(RenderPiplineStateLibrary.PiplineState(.Instanced))
        
        renderCommandEncoder.setDepthStencilState(DepthStencilStateLibrary.DepthStencilState(.Less))
        
        
        // Vertex Shader
        
        // 기본 모양을 위한 버텍스
        renderCommandEncoder.setVertexBuffer(_mesh.vertexBuffer,
                                             offset: 0,
                                             index: 0)
        
        // 움직임을 위한 메트릭스 버텍스 [모든 노드에대한 버퍼]
        renderCommandEncoder.setVertexBuffer(_modelConstantBuffer, offset: 0, index: 2)
        
        // Fragment Shader
        renderCommandEncoder.setFragmentBytes(&material, length: Material.stride(), index: 1)
        
        _mesh.drawPrimitives(renderCommandEncoder)
    }
}


// Material Properties
extension InstancedGameObject {
    public func setColor(_ color: SIMD4<Float>) {
        self.material.color = color
        self.material.useMaterialColor = true
    }
}
