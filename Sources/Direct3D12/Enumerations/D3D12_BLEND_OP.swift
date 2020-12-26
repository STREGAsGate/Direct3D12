
import _d3d12

/// Specifies RGB or alpha blending operations.
public enum BlendOperation {
    ///	Add source 1 and source 2.
    case add
    ///	Subtract source 1 from source 2.
    case subtract
    ///	Subtract source 2 from source 1.
    case reverseSubtract
    ///	Find the minimum of source 1 and source 2.
    case minimum
    ///	Find the maximum of source 1 and source 2.
    case maximum

    internal var rawValue: _d3d12.D3D12_BLEND_OP {
        switch self {
        case .add:
            return _d3d12.D3D12_BLEND_OP_ADD
        case .subtract:
            return _d3d12.D3D12_BLEND_OP_SUBTRACT
        case .reverseSubtract:
            return _d3d12.D3D12_BLEND_OP_REV_SUBTRACT
        case .minimum:
            return _d3d12.D3D12_BLEND_OP_MIN
        case .maximum:
            return _d3d12.D3D12_BLEND_OP_MAX
        }
    }
}


//MARK: - Original Style API

@available(*, deprecated, renamed: "BlendOperation")
public typealias D3D12_BLEND_OP = BlendOperation

public extension BlendOperation {
    @available(*, deprecated, renamed: "add")
    static let D3D12_BLEND_OP_ADD = Self.add

    @available(*, deprecated, renamed: "subtract")
    static let D3D12_BLEND_OP_SUBTRACT = Self.subtract

    @available(*, deprecated, renamed: "reverseSubtract")
    static let D3D12_BLEND_OP_REV_SUBTRACT = Self.reverseSubtract

    @available(*, deprecated, renamed: "minimum")
    static let D3D12_BLEND_OP_MIN = Self.minimum

    @available(*, deprecated, renamed: "maximum")
    static let D3D12_BLEND_OP_MAX = Self.maximum
}
