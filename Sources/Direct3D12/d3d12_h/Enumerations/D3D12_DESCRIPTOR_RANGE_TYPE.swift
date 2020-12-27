
import _d3d12

/// Specifies a type of descriptor heap.
public enum DescriptorRangeType {
    ///	Specifies a range of SRVs.
    //TODO: Figure out what srv stands for
    case srv
    ///	Specifies a range of unordered-access views (UAVs).
    case unorderedAccessView
    ///	Specifies a range of constant-buffer views (CBVs).
    case constantBufferView
    ///	Specifies a range of samplers.
    case sampler

    internal var rawValue: _d3d12.D3D12_DESCRIPTOR_RANGE_TYPE {
        switch self {
        case .srv:
            return _d3d12.D3D12_DESCRIPTOR_RANGE_TYPE_SRV
        case .unorderedAccessView:
            return _d3d12.D3D12_DESCRIPTOR_RANGE_TYPE_UAV
        case .constantBufferView:
            return _d3d12.D3D12_DESCRIPTOR_RANGE_TYPE_CBV
        case .sampler:
            return _d3d12.D3D12_DESCRIPTOR_RANGE_TYPE_SAMPLER
        }
    }
}
  

//MARK: - Original Style API

@available(*, deprecated, renamed: "DescriptorRangeType")
public typealias D3D12_DESCRIPTOR_RANGE_TYPE  = DescriptorRangeType

public extension DescriptorRangeType {
    @available(*, deprecated, renamed: "srv")
    static let D3D12_DESCRIPTOR_RANGE_TYPE_SRV = Self.srv

    @available(*, deprecated, renamed: "unorderedAccessView")
    static let D3D12_DESCRIPTOR_RANGE_TYPE_UAV = Self.unorderedAccessView

    @available(*, deprecated, renamed: "constantBufferView")
    static let D3D12_DESCRIPTOR_RANGE_TYPE_CBV = Self.constantBufferView

    @available(*, deprecated, renamed: "sampler")
    static let D3D12_DESCRIPTOR_RANGE_TYPE_SAMPLER = Self.sampler
}
