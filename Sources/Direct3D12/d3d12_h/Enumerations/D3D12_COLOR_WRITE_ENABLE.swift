
import _d3d12

/// Identifies which components of each pixel of a render target are writable during blending.
public struct ColorWriteEnable: OptionSet {
    public let rawValue: Int32

    /// Allow data to be stored in the red component.
    static let red = ColorWriteEnable(rawValue: _d3d12.D3D12_COLOR_WRITE_ENABLE_RED.rawValue)

    /// Allow data to be stored in the green component.
    static let green = ColorWriteEnable(rawValue: _d3d12.D3D12_COLOR_WRITE_ENABLE_GREEN.rawValue)

    /// Allow data to be stored in the blue component.
    static let blue = ColorWriteEnable(rawValue: _d3d12.D3D12_COLOR_WRITE_ENABLE_BLUE.rawValue)

    /// Allow data to be stored in the alpha component.
    static let alpha = ColorWriteEnable(rawValue: _d3d12.D3D12_COLOR_WRITE_ENABLE_ALPHA.rawValue)

    /// Allow data to be stored in all components.
    static let all = ColorWriteEnable(rawValue: _d3d12.D3D12_COLOR_WRITE_ENABLE_ALL.rawValue)

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
    public init() {
        self.rawValue = 0
    }
}


//MARK: - Original Style API

@available(*, deprecated, renamed: "ColorWriteEnable")
public typealias D3D12_COLOR_WRITE_ENABLE = ColorWriteEnable

public extension ColorWriteEnable {
    @available(*, deprecated, renamed: "red")
    static let D3D12_COLOR_WRITE_ENABLE_RED = Self.red

    @available(*, deprecated, renamed: "green")
    static let D3D12_COLOR_WRITE_ENABLE_GREEN = Self.green

    @available(*, deprecated, renamed: "blue")
    static let D3D12_COLOR_WRITE_ENABLE_BLUE = Self.blue

    @available(*, deprecated, renamed: "alpha")
    static let D3D12_COLOR_WRITE_ENABLE_ALPHA = Self.alpha

    @available(*, deprecated, renamed: "all")
    static let D3D12_COLOR_WRITE_ENABLE_ALL = Self.all
}
