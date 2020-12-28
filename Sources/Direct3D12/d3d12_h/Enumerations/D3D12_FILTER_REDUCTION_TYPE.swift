
import _d3d12

/// Specifies the type of filter reduction.
public enum FilterReductionType {
    ///	The filter type is standard.
    case standard
    ///	The filter type is comparison.
    case comparison
    ///	The filter type is minimum.
    case minimum
    ///	The filter type is maximum.
    case maximum

    internal var rawValue: _d3d12.D3D12_FILTER_REDUCTION_TYPE {
        switch self {
        case .standard:
            return _d3d12.D3D12_FILTER_REDUCTION_TYPE_STANDARD
        case .comparison:
            return _d3d12.D3D12_FILTER_REDUCTION_TYPE_COMPARISON
        case .minimum:
            return _d3d12.D3D12_FILTER_REDUCTION_TYPE_MINIMUM
        case .maximum:
            return _d3d12.D3D12_FILTER_REDUCTION_TYPE_MAXIMUM
        }
    }
}
  

//MARK: - Original Style API

@available(*, deprecated, renamed: "FilterReductionType")
public typealias D3D12_FILTER_REDUCTION_TYPE = FilterReductionType

public extension FilterReductionType  {
    @available(*, deprecated, renamed: "standard")
    static let D3D12_FILTER_REDUCTION_TYPE_STANDARD = Self.standard
    
    @available(*, deprecated, renamed: "comparison")
    static let D3D12_FILTER_REDUCTION_TYPE_COMPARISON = Self.comparison
    
    @available(*, deprecated, renamed: "minimum")
    static let D3D12_FILTER_REDUCTION_TYPE_MINIMUM = Self.minimum
     
    @available(*, deprecated, renamed: "maximum")
    static let D3D12_FILTER_REDUCTION_TYPE_MAXIMUM = Self.maximum
}
