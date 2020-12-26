
import _d3d12

/// Specifies options for a heap.
public struct DescriptorHeapFlags: OptionSet {
    public let rawValue: Int32

    //Use an empty collection `[]` to represent none in Swift.
    ///// Indicates default usage of a heap.
    //static let none = DescriptorHeapFlags(rawValue: _d3d12.D3D12_DESCRIPTOR_HEAP_FLAG_NONE.rawValue)

    /**
    The flag [D3D12_DESCRIPTOR_HEAP_FLAG_SHADER_VISIBLE](https://docs.microsoft.com/en-us/windows/win32/api/d3d12/ne-d3d12-d3d12_descriptor_heap_flags) can optionally be set on a descriptor heap to indicate it is be bound on a command list for reference by shaders. Descriptor heaps created without this flag allow applications the option to stage descriptors in CPU memory before copying them to a shader visible descriptor heap, as a convenience. But it is also fine for applications to directly create descriptors into shader visible descriptor heaps with no requirement to stage anything on the CPU.

    Descriptor heaps bound via [ID3D12GraphicsCommandList::SetDescriptorHeaps](https://docs.microsoft.com/en-us/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-setdescriptorheaps) must have the D3D12_DESCRIPTOR_HEAP_FLAG_SHADER_VISIBLE flag set, else the debug layer will produce an error.

    Descriptor heaps with the D3D12_DESCRIPTOR_HEAP_FLAG_SHADER_VISIBLE flag can't be used as the source heaps in calls to [ID3D12Device::CopyDescriptors](https://docs.microsoft.com/en-us/windows/win32/api/d3d12/windows/win32/api/d3d12/nf-d3d12-id3d12device-copydescriptors) or [ID3D12Device::CopyDescriptorsSimple](https://docs.microsoft.com/en-us/windows/win32/api/d3d12/windows/win32/api/d3d12/nf-d3d12-id3d12device-copydescriptorssimple), because they could be resident in WRITE_COMBINE memory or GPU-local memory, which is very inefficient to read from.

    This flag only applies to CBV/SRV/UAV descriptor heaps, and sampler descriptor heaps. It does not apply to other descriptor heap types since shaders do not directly reference the other types. Attempting to create an RTV/DSV heap with D3D12_DESCRIPTOR_HEAP_FLAG_SHADER_VISIBLE results in a debug layer error.
    */
    static let shaderVisible = DebugFeature(rawValue: _d3d12.D3D12_DESCRIPTOR_HEAP_FLAG_SHADER_VISIBLE.rawValue) 

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
    public init() {
        self.rawValue = 0
    }
}


//MARK: - Original Style API

@available(*, deprecated, renamed: "DescriptorHeapFlags")
public typealias D3D12_DESCRIPTOR_HEAP_FLAGS = DescriptorHeapFlags

public extension DescriptorHeapFlags  {
    @available(*, deprecated, message: "Use [] to represent none in Swift.")
    static let D3D12_DESCRIPTOR_HEAP_FLAG_NONE: DescriptorHeapFlags = []

    @available(*, deprecated, renamed: "shaderVisible")
    static let D3D12_DESCRIPTOR_HEAP_FLAG_SHADER_VISIBLE = Self.shaderVisible
}
