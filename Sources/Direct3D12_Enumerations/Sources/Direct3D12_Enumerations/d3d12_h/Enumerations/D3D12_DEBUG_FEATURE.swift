/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Flags for optional D3D12 Debug Layer features.
public struct DebugFeature: OptionSet {
    public let rawValue: Int32

    //Use an empty collection `[]` to represent none in Swift.
    ///// The default. No optional Debug Layer features.
    //static let none = DebugFeature(rawValue: WinSDK.D3D12_DEBUG_FEATURE_NONE.rawValue)

    ///	The Debug Layer is allowed to deliberately change functional behavior of an application in order to help identify potential errors. By default, the Debug Layer allows most invalid API usage to run the natural course.
    static let allowBehaviorChangingDebugAids = DebugFeature(rawValue: WinSDK.D3D12_DEBUG_FEATURE_ALLOW_BEHAVIOR_CHANGING_DEBUG_AIDS.rawValue) 
    ///	Performs additional resource state validation of resources set in descriptors at the time [ID3D12CommandQueue::ExecuteCommandLists](https://docs.microsoft.com/en-us/windows/desktop/api/d3d12/nf-d3d12-id3d12commandqueue-executecommandlists) is called. By design descriptors can be changed even after submitting command lists assuming proper synchronization. Conservative resource state tracking ignores this allowance and validates all resources used in descriptor tables when ExecuteCommandLists is called. The result may be false validation errors.
    static let conservativeResourceStateTracking = DebugFeature(rawValue: WinSDK.D3D12_DEBUG_FEATURE_CONSERVATIVE_RESOURCE_STATE_TRACKING.rawValue) 
    ///	Disables validation of bundle commands by virtually injecting checks into the calling command list validation paths.
    static let disablesVirtualizedBundlesValidation = DebugFeature(rawValue: WinSDK.D3D12_DEBUG_FEATURE_DISABLE_VIRTUALIZED_BUNDLES_VALIDATION.rawValue) 

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
    public init() {
        self.rawValue = 0
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "DebugFeature")
public typealias D3D12_DEBUG_FEATURE = DebugFeature

public extension DebugFeature {
    @available(*, deprecated, message: "Use [] to represent none in Swift.")
    static let D3D12_COMMAND_QUEUE_FLAG_NONE: DebugFeature = []

    @available(*, deprecated, renamed: "allowBehaviorChangingDebugAids")
    static let D3D12_DEBUG_FEATURE_ALLOW_BEHAVIOR_CHANGING_DEBUG_AIDS = Self.allowBehaviorChangingDebugAids

    @available(*, deprecated, renamed: "conservativeResourceStateTracking")
    static let D3D12_DEBUG_FEATURE_CONSERVATIVE_RESOURCE_STATE_TRACKING = Self.conservativeResourceStateTracking

    @available(*, deprecated, renamed: "disablesVirtualizedBundlesValidation")
    static let D3D12_DEBUG_FEATURE_DISABLE_VIRTUALIZED_BUNDLES_VALIDATION = Self.disablesVirtualizedBundlesValidation
}

#endif
