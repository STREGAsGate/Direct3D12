
import _d3d12

/// Identifies whether conservative rasterization is on or off.
public enum ConservativeRasterizationMode {
    ///	Conservative rasterization is off.
    case off
    ///	Conservative rasterization is on.
    case on

    internal var rawValue: _d3d12.D3D12_CONSERVATIVE_RASTERIZATION_MODE {
        switch self {
        case .off:
            return _d3d12.D3D12_CONSERVATIVE_RASTERIZATION_MODE_OFF
        case .on:
            return _d3d12.D3D12_CONSERVATIVE_RASTERIZATION_MODE_ON
        }
    }
}


//MARK: - Original Style API

@available(*, deprecated, renamed: "ConservativeRasterizationMode")
public typealias D3D12_CONSERVATIVE_RASTERIZATION_MODE = ConservativeRasterizationMode

public extension ConservativeRasterizationMode  {
    @available(*, deprecated, renamed: "off")
    static let D3D12_CONSERVATIVE_RASTERIZATION_MODE_OFF = Self.off
    
    @available(*, deprecated, renamed: "on")
    static let D3D12_CONSERVATIVE_RASTERIZATION_MODE_ON = Self.on
}
