/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK.DirectX.Direct3D12

/// Describes how the locations of elements are identified.
public enum ElementsLayout  {
    ///	For a data set of n elements, the pointer parameter points to the start of n elements in memory.
    case array
    ///	For a data set of n elements, the pointer parameter points to an array of n pointers in memory, each pointing to an individual element of the set.
    case arrayOfPointers

    internal var rawValue: WinSDK.D3D12_ELEMENTS_LAYOUT {
        switch self {
        case .array:
            return WinSDK.D3D12_ELEMENTS_LAYOUT_ARRAY
        case .arrayOfPointers:
            return WinSDK.D3D12_ELEMENTS_LAYOUT_ARRAY_OF_POINTERS
        }
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "ElementsLayout")
public typealias D3D12_ELEMENTS_LAYOUT = ElementsLayout

public extension ElementsLayout {
    @available(*, deprecated, renamed: "array")
    static let D3D12_ELEMENTS_LAYOUT_ARRAY = Self.array

    @available(*, deprecated, renamed: "arrayOfPointers")
    static let D3D12_ELEMENTS_LAYOUT_ARRAY_OF_POINTERS = Self.arrayOfPointers
}

#endif
