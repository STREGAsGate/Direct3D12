/**
 * Copyright (c) 2020 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import _d3d12

/// Specifies what type of texture copy is to take place.
public enum TextureCopyType {
    ///	Indicates a subresource, identified by an index, is to be copied.
    case subresourceIndex
    ///	Indicates a place footprint, identified by a D3D12_PLACED_SUBRESOURCE_FOOTPRINT structure, is to be copied.
    case placedFootprint

    internal var rawValue: _d3d12.D3D12_TEXTURE_COPY_TYPE {
        switch self {
        case .subresourceIndex:
            return _d3d12.D3D12_TEXTURE_COPY_TYPE_SUBRESOURCE_INDEX
        case .placedFootprint:
            return _d3d12.D3D12_TEXTURE_COPY_TYPE_PLACED_FOOTPRINT
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "TextureCopyType")
public typealias D3D12_TEXTURE_COPY_TYPE = TextureCopyType

public extension TextureCopyType  {
    @available(*, deprecated, renamed: "subresourceIndex")
    static let D3D12_TEXTURE_COPY_TYPE_SUBRESOURCE_INDEX = Self.subresourceIndex
    
    @available(*, deprecated, renamed: "placedFootprint")
    static let D3D12_TEXTURE_COPY_TYPE_PLACED_FOOTPRINT = Self.placedFootprint
}

#endif
