import MetalKit


class Cube: GameObject {
    init() {
        super.init(meshType: .Cube_Custom)
    }
 
    
    override func update(deltaTime: Float) {
        // 자식들을 == (point (gameObjct, Node)) 컨트롤 하고싶을때 추가로직을 사용함
        self.rotation.x += (Float.randomZeroToOne * deltaTime)
        self.rotation.y += (Float.randomZeroToOne * deltaTime)
        // 즉각 Scene호출 혹은 없으면 Node로 호출됨
        super.update(deltaTime: deltaTime)
    }
}
