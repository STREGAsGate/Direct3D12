
import _d3d12


///Represents a virtual adapter; it is used to create command allocators, command lists, command queues, fences, resources, 
///pipeline state objects, heaps, root signatures, samplers, and many resource views. 
open class Device: Object {
    override public class var IID: IID { IID_ID3D12Device }
}

public extension Device {
    ///Reports the number of physical adapters (nodes) that are associated with this device.
    var nodeCount: UInt {
        do {
            let v = try _GetNodeCount()
            return UInt(v)
        }catch{
            fatalError("\(error)")
        }
    }

    ///Reports the number of physical adapters (nodes) that are associated with this device.
    func _GetNodeCount() throws -> _d3d12.UINT {
        guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {throw Error(.pUnkFailed)}
        let pThis = pUnk.bindMemory(to: _d3d12.ID3D12Device.self, capacity: 1)
        return pThis.pointee.lpVtbl.pointee.GetNodeCount(pThis)
    }
}
