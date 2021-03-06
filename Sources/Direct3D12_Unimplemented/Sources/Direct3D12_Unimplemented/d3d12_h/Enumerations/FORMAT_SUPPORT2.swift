/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

/// Specifies which unordered resource options are supported for a provided format.
public struct FormatSupport2: OptionSet {
    public let rawValue: Int32
    //Use an empty collection `[]` to represent none in Swift.
    ///// No unordered resource options are supported.
    //public static let none = FormatSupport2(rawValue: WinSDK.D3D12_FORMAT_SUPPORT2_NONE.rawValue)

    ///	Format supports atomic add.
    public static let uavAtomicAdd = FormatSupport2(rawValue: WinSDK.D3D12_FORMAT_SUPPORT2_UAV_ATOMIC_ADD.rawValue)
    ///	Format supports atomic bitwise operations.
    public static let uavAtomicBitwiseOperations = FormatSupport2(rawValue: WinSDK.D3D12_FORMAT_SUPPORT2_UAV_ATOMIC_BITWISE_OPS.rawValue)
    ///	Format supports atomic compare with store or exchange.
    public static let uavAtomicComparerStoreOrCompareExchange = FormatSupport2(rawValue: WinSDK.D3D12_FORMAT_SUPPORT2_UAV_ATOMIC_COMPARE_STORE_OR_COMPARE_EXCHANGE.rawValue)
    ///	Format supports atomic exchange.
    public static let uavAtomicExchange = FormatSupport2(rawValue: WinSDK.D3D12_FORMAT_SUPPORT2_UAV_ATOMIC_EXCHANGE.rawValue)
    ///	Format supports atomic min and max.
    public static let uavAtomicSignedMinOrMax = FormatSupport2(rawValue: WinSDK.D3D12_FORMAT_SUPPORT2_UAV_ATOMIC_SIGNED_MIN_OR_MAX.rawValue)
    ///	Format supports atomic unsigned min and max.
    public static let uavAtomicUnsignedMinOrMax = FormatSupport2(rawValue: WinSDK.D3D12_FORMAT_SUPPORT2_UAV_ATOMIC_UNSIGNED_MIN_OR_MAX.rawValue)
    ///	Format supports a typed load.
    public static let uavTypedLoad = FormatSupport2(rawValue: WinSDK.D3D12_FORMAT_SUPPORT2_UAV_TYPED_LOAD.rawValue)
    ///	Format supports a typed store.
    public static let uavTypedStore = FormatSupport2(rawValue: WinSDK.D3D12_FORMAT_SUPPORT2_UAV_TYPED_STORE.rawValue)
    ///	Format supports logic operations in blend state.
    public static let outputMergerLogicOperation = FormatSupport2(rawValue: WinSDK.D3D12_FORMAT_SUPPORT2_OUTPUT_MERGER_LOGIC_OP.rawValue)
    ///	Format supports tiled resources. Refer to Volume Tiled Resources.
    public static let tiled = FormatSupport2(rawValue: WinSDK.D3D12_FORMAT_SUPPORT2_TILED.rawValue)
    ///	Format supports multi-plane overlays.
    public static let multiplaneOverlay = FormatSupport2(rawValue: WinSDK.D3D12_FORMAT_SUPPORT2_MULTIPLANE_OVERLAY.rawValue)

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
    public init() {
        self.rawValue = 0
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "FormatSupport2")
public typealias D3D12_FORMAT_SUPPORT2 = FormatSupport2

public extension FormatSupport2 {
    @available(*, deprecated, message: "Use [] to represent none in Swift.")
    static let D3D12_FORMAT_SUPPORT2_NONE: FormatSupport2 = []

    @available(*, deprecated, renamed: "uavAtomicAdd")
    static let D3D12_FORMAT_SUPPORT2_UAV_ATOMIC_ADD = Self.uavAtomicAdd

    @available(*, deprecated, renamed: "uavAtomicBitwiseOperations")
    static let D3D12_FORMAT_SUPPORT2_UAV_ATOMIC_BITWISE_OPS = Self.uavAtomicBitwiseOperations

    @available(*, deprecated, renamed: "uavAtomicComparerStoreOrCompareExchange")
    static let D3D12_FORMAT_SUPPORT2_UAV_ATOMIC_COMPARE_STORE_OR_COMPARE_EXCHANGE = Self.uavAtomicComparerStoreOrCompareExchange

    @available(*, deprecated, renamed: "uavAtomicExchange")
    static let D3D12_FORMAT_SUPPORT2_UAV_ATOMIC_EXCHANGE = Self.uavAtomicExchange

    @available(*, deprecated, renamed: "uavAtomicSignedMinOrMax")
    static let D3D12_FORMAT_SUPPORT2_UAV_ATOMIC_SIGNED_MIN_OR_MAX = Self.uavAtomicSignedMinOrMax

    @available(*, deprecated, renamed: "uavAtomicUnsignedMinOrMax")
    static let D3D12_FORMAT_SUPPORT2_UAV_ATOMIC_UNSIGNED_MIN_OR_MAX = Self.uavAtomicUnsignedMinOrMax

    @available(*, deprecated, renamed: "uavTypedLoad")
    static let D3D12_FORMAT_SUPPORT2_UAV_TYPED_LOAD = Self.uavTypedLoad

    @available(*, deprecated, renamed: "uavTypedStore")
    static let D3D12_FORMAT_SUPPORT2_UAV_TYPED_STORE = Self.uavTypedStore

    @available(*, deprecated, renamed: "outputMergerLogicOperation")
    static let D3D12_FORMAT_SUPPORT2_OUTPUT_MERGER_LOGIC_OP = Self.outputMergerLogicOperation

    @available(*, deprecated, renamed: "tiled")
    static let D3D12_FORMAT_SUPPORT2_TILED = Self.tiled

    @available(*, deprecated, renamed: "multiplaneOverlay")
    static let D3D12_FORMAT_SUPPORT2_MULTIPLANE_OVERLAY = Self.multiplaneOverlay
}

#endif
