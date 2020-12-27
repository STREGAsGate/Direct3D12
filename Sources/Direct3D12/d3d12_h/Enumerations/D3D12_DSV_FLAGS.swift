
import _d3d12

/// Specifies depth-stencil view options.
public struct DepthStencilViewFlags: OptionSet {
    public let rawValue: Int32

    //Use an empty collection `[]` to represent none in Swift.
    ///// Indicates a default view.
    //static let none = DepthStencilViewFlags(rawValue: _d3d12.D3D12_DSV_FLAG_NONE.rawValue)

    ///	Indicates that depth values are read only.
    static let readOnlyDepth = DepthStencilViewFlags(rawValue: _d3d12.D3D12_DSV_FLAG_READ_ONLY_DEPTH.rawValue)

    ///	Indicates that stencil values are read only.
    static let readOnlyStencil = DepthStencilViewFlags(rawValue: _d3d12.D3D12_DSV_FLAG_READ_ONLY_STENCIL.rawValue)

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
    public init() {
        self.rawValue = 0
    }
}


//MARK: - Original Style API

@available(*, deprecated, renamed: "DepthStencilViewFlags")
public typealias D3D12_DSV_FLAGS = DepthStencilViewFlags

public extension DepthStencilViewFlags {
    @available(*, deprecated, message: "Use [] to represent none in Swift.")
    static let D3D12_DSV_FLAG_NONE: DescriptorRangeFlags = []

    @available(*, deprecated, renamed: "readOnlyDepth")
    static let D3D12_DSV_FLAG_READ_ONLY_DEPTH = Self.readOnlyDepth

    @available(*, deprecated, renamed: "readOnlyStencil")
    static let D3D12_DSV_FLAG_READ_ONLY_STENCIL = Self.readOnlyStencil
}
