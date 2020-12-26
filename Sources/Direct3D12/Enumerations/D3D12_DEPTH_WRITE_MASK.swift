
import _d3d12

/// Identifies the portion of a depth-stencil buffer for writing depth data.
public enum DepthWriteMask {
    ///	Turn off writes to the depth-stencil buffer.
    case zero
    ///	Turn on writes to the depth-stencil buffer.
    case all

    internal var rawValue: _d3d12.D3D12_DEPTH_WRITE_MASK {
        switch self {
    case .zero:
        return _d3d12.D3D12_DEPTH_WRITE_MASK_ZERO
    case .all:
        return _d3d12.D3D12_DEPTH_WRITE_MASK_ALL
        }
    }
}


//MARK: - Original Style API

@available(*, deprecated, renamed: "DepthWriteMask")
public typealias D3D12_DEPTH_WRITE_MASK = DepthWriteMask

public extension DepthWriteMask  {
    @available(*, deprecated, renamed: "zero")
    static let D3D12_DEPTH_WRITE_MASK_ZERO = Self.zero

    @available(*, deprecated, renamed: "all")
    static let D3D12_DEPTH_WRITE_MASK_ALL = Self.all
}
