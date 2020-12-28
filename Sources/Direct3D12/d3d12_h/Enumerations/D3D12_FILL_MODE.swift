
import _d3d12

/// Specifies the fill mode to use when rendering triangles.
public enum FillMode {
    ///	Draw lines connecting the vertices. Adjacent vertices are not drawn.
    case wireframe
    ///	Fill the triangles formed by the vertices. Adjacent vertices are not drawn.
    case solid

    internal var rawValue: _d3d12.D3D12_FILL_MODE {
        switch self {
        case .wireframe:
            return _d3d12.D3D12_FILL_MODE_WIREFRAME
        case .solid:
            return _d3d12.D3D12_FILL_MODE_SOLID
        }
    }
}


//MARK: - Original Style API

@available(*, deprecated, renamed: "FillMode")
public typealias D3D12_FILL_MODE = FillMode

public extension FillMode  {
    @available(*, deprecated, renamed: "wireframe")
    static let D3D12_FILL_MODE_WIREFRAME = Self.wireframe

    @available(*, deprecated, renamed: "solid")
    static let D3D12_FILL_MODE_SOLID = Self.solid
}
