/**
 * Copyright (c) 2020 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import _d3d12

/// When using triangle strip primitive topology, vertex positions are interpreted as vertices of a continuous triangle “strip”. There is a special index value that represents the desire to have a discontinuity in the strip, the cut index value. This enum lists the supported cut values.
public enum IndexBufferStripCutValue {
///	Indicates that there is no cut value.
case disabled
///	Indicates that 0xFFFF should be used as the cut value.
case use0xFFFF
///	Indicates that 0xFFFFFFFF should be used as the cut value.
case use0xFFFFFFFF

    internal var rawValue: _d3d12.D3D12_INDEX_BUFFER_STRIP_CUT_VALUE {
        switch self {
        case .disabled:
            return _d3d12.D3D12_INDEX_BUFFER_STRIP_CUT_VALUE_DISABLED
        case .use0xFFFF:
            return _d3d12.D3D12_INDEX_BUFFER_STRIP_CUT_VALUE_0xFFFF
        case .use0xFFFFFFFF:
            return _d3d12.D3D12_INDEX_BUFFER_STRIP_CUT_VALUE_0xFFFFFFFF
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "IndexBufferStripCutValue")
public typealias D3D12_INDEX_BUFFER_STRIP_CUT_VALUE = IndexBufferStripCutValue

public extension IndexBufferStripCutValue  {
    @available(*, deprecated, renamed: "disabled")
    static let D3D12_INDEX_BUFFER_STRIP_CUT_VALUE_DISABLED = Self.disabled
    
    @available(*, deprecated, renamed: "use0xFFFF")
    static let D3D12_INDEX_BUFFER_STRIP_CUT_VALUE_0xFFFF = Self.use0xFFFF
    
    @available(*, deprecated, renamed: "use0xFFFFFFFF")
    static let D3D12_INDEX_BUFFER_STRIP_CUT_VALUE_0xFFFFFFFF = Self.use0xFFFFFFFF
}

#endif
