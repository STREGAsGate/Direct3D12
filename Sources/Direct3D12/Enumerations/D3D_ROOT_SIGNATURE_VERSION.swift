
import _d3d12

/// Specifies the version of root signature layout.
public enum RootSignatureVersion {
    /// Version one of root signature layout.
    case v1_0
    ///	Version 1.1 of root signature layout.
    case v1_1

    internal var rawValue: _d3d12.D3D_ROOT_SIGNATURE_VERSION {
        switch self {
            case .v1_0:
                return _d3d12.D3D_ROOT_SIGNATURE_VERSION_1_0
            case .v1_1:
                return _d3d12.D3D_ROOT_SIGNATURE_VERSION_1_1
        }
    }
}


//MARK: - Original Style API

@available(*, deprecated, renamed: "RootSignatureVersion")
public typealias D3D_ROOT_SIGNATURE_VERSION = RootSignatureVersion

public extension RootSignatureVersion  {
    @available(*, deprecated, renamed: "v1_0")
    static let D3D_ROOT_SIGNATURE_VERSION_1_0 = Self.v1_0

    @available(*, deprecated, renamed: "v1_1")
    static let D3D_ROOT_SIGNATURE_VERSION_1_1 = Self.v1_1
}
