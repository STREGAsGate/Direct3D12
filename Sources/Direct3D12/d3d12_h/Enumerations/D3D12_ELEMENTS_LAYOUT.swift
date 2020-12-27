
import _d3d12

/// Describes how the locations of elements are identified.
public enum ElementsLayout  {
    ///	For a data set of n elements, the pointer parameter points to the start of n elements in memory.
    case array
    ///	For a data set of n elements, the pointer parameter points to an array of n pointers in memory, each pointing to an individual element of the set.
    case arrayOfPointers

    internal var rawValue: _d3d12.D3D12_ELEMENTS_LAYOUT {
        switch self {
        case .array:
            return _d3d12.D3D12_ELEMENTS_LAYOUT_ARRAY
        case .arrayOfPointers:
            return _d3d12.D3D12_ELEMENTS_LAYOUT_ARRAY_OF_POINTERS
        }
    }
}


//MARK: - Original Style API

@available(*, deprecated, renamed: "ElementsLayout")
public typealias D3D12_ELEMENTS_LAYOUT = ElementsLayout

public extension ElementsLayout {
    @available(*, deprecated, renamed: "array")
    static let D3D12_ELEMENTS_LAYOUT_ARRAY = Self.array

    @available(*, deprecated, renamed: "arrayOfPointers")
    static let D3D12_ELEMENTS_LAYOUT_ARRAY_OF_POINTERS = Self.arrayOfPointers
}
