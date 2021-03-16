/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK

/// Defines constants that specify what should be done with the results of earlier workload instrumentation.
public enum MeasurmentAction {
    ///	The default setting. Specifies that all results should be kept.
    case keepAll
    ///	Specifies that the driver has seen all the data that it's ever going to, so it should stop waiting for more and go ahead compiling optimized shaders.
    case commitResults
    ///	Like D3D12_MEASUREMENTS_ACTION_COMMIT_RESULTS, but also specifies that your application doesn't care about glitches, so the runtime should ignore the usual idle priority rules and go ahead using as many threads as possible to get shader recompiles done fast. Available only in Developer mode.
    case commitResultsHighPriority
    ///	Specifies that the optimization state should be reset; hinting that whatever has previously been measured no longer applies.
    case discardPrevious

    internal var rawValue: WinSDK.D3D12_MEASUREMENTS_ACTION {
        switch self {
        case .keepAll:
            return WinSDK.D3D12_MEASUREMENTS_ACTION_KEEP_ALL
        case .commitResults:
            return WinSDK.D3D12_MEASUREMENTS_ACTION_COMMIT_RESULTS
        case .commitResultsHighPriority:
            return WinSDK.D3D12_MEASUREMENTS_ACTION_COMMIT_RESULTS_HIGH_PRIORITY
        case .discardPrevious:
            return WinSDK.D3D12_MEASUREMENTS_ACTION_DISCARD_PREVIOUS
        }
    }
}
  

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "MeasurmentAction")
public typealias D3D12_MEASUREMENTS_ACTION = MeasurmentAction

public extension MeasurmentAction  {
    @available(*, deprecated, renamed: "keepAll")
    static let D3D12_MEASUREMENTS_ACTION_KEEP_ALL = Self.keepAll

    @available(*, deprecated, renamed: "commitResults")
    static let D3D12_MEASUREMENTS_ACTION_COMMIT_RESULTS = Self.commitResults
 
    @available(*, deprecated, renamed: "commitResultsHighPriority")
    static let D3D12_MEASUREMENTS_ACTION_COMMIT_RESULTS_HIGH_PRIORITY = Self.commitResultsHighPriority
 
    @available(*, deprecated, renamed: "discardPrevious")
    static let D3D12_MEASUREMENTS_ACTION_DISCARD_PREVIOUS = Self.discardPrevious
}

#endif
