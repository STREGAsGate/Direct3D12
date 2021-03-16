/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK

/// Specifies options for view instancing.
public struct ViewInstancingFlags: OptionSet {
    public let rawValue: Int32
    //Use an empty collection `[]` to represent none in Swift.
    ///// Indicates a default view instancing configuration.
    //static let none = ViewInstancingFlags(rawValue: WinSDK.D3D12_VIEW_INSTANCING_FLAG_NONE.rawValue)

    /// Enables view instance masking.
    static let enableViewInstanceMasking = ViewInstancingFlags(rawValue: WinSDK.D3D12_VIEW_INSTANCING_FLAG_ENABLE_VIEW_INSTANCE_MASKING.rawValue)

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
    public init() {
        self.rawValue = 0
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "ViewInstancingFlags")
public typealias D3D12_VIEW_INSTANCING_FLAGS = ViewInstancingFlags

public extension ViewInstancingFlags {
    @available(*, deprecated, message: "Use [] to represent none in Swift.")
    static let D3D12_VIEW_INSTANCING_FLAG_NONE: ViewInstancingFlags = []

    @available(*, deprecated, renamed: "enableViewInstanceMasking")
    static let D3D12_VIEW_INSTANCING_FLAG_ENABLE_VIEW_INSTANCE_MASKING = Self.enableViewInstanceMasking
}

#endif
