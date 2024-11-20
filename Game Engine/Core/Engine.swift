import Foundation
import MetalKit

class Engine {
    
    public static var Device: MTLDevice!
    public static var commandQueue: MTLCommandQueue!
    
    public static func Ignite(device: MTLDevice) {
        self.Device = device
        self.commandQueue = device.makeCommandQueue()
        
        //makeFunction 라이브러리 함수 생성 [Engine.Device 사용]
        ShaderLibrary.Initialize()
        
        // 버텍스 디스크립토 생성 == 쉐이더에서 vertexId를 사용하지않고 바로 다이렉트로 attribute(index) 를사용해 객체에
        // 알려주기 위한 작업
        VertexDescriptorLibrary.Initialize()
        
        // 뎁스 깊이?
        DepthStencilStateLibrary.Initialize()
        
        // 파이프라인 디스크립토 생성 == 위에서만든 라이브러리 함수와 버텍스 디스크립토를 담는 파이프라인 설명객체
        RenderPiplineDescriptorLibrary.Initialize()
        
        // makeRenderPipelineState [Engine.Device 사용] 을 만들어서 바로 위에서 만든
        // 파이프라인 디스크립토 를 파이프라인 상태에 넣어줌
        RenderPiplineStateLibrary.Initailize()
        
        // 버텍스버퍼 생성 [Engine.Device 사용 하여 버퍼 생성] [매쉬형식의 버퍼를 생성]
        MeshLibrary.Initialize()
        
        // 신매니저 생성 [샌드박스 생성]
        SceneManager.Initialze(Preferences.StartingSceneType)
        
    }
    
}
