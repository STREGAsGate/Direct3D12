/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

@available(Windows, introduced: 10.0.18362)
public extension Device {

    /** Sets the mode for driver background processing optimizations.
    - parameter mode: The level of dynamic optimization to apply to GPU work that's subsequently submitted.
    - parameter action: The action to take with the results of earlier workload instrumentation.
    - parameter handle: An optional handle to signal when the function is complete. For example, if MeasurementsAction is set to D3D12_MEASUREMENTS_ACTION_COMMIT_RESULTS, then hEventToSignalUponCompletion is signaled when all resulting compilations have finished.
    - returns: An optional pointer to a Boolean value. The function sets the value to true to indicate that you should continue profiling, otherwise, false.
    */
    @discardableResult
    func setBackgroundProcessingMode(_ mode: BackgroundProcessingMode, 
                                     action: MeasurmentsAction, 
                                     handle: UnsafeMutableRawPointer? = nil) throws -> Bool {
        return try perform(as: RawValue6.self) {pThis in
            let Mode = mode.rawValue
            let MeasurementsAction = action.rawValue
            let hEventToSignalUponCompletion = handle
            var pbFurtherMeasurementsDesired: WindowsBool = WindowsBool(false)
            try pThis.pointee.lpVtbl.pointee.SetBackgroundProcessingMode(pThis, Mode, MeasurementsAction, hEventToSignalUponCompletion, &pbFurtherMeasurementsDesired).checkResult(self, #function)
            return pbFurtherMeasurementsDesired.boolValue
        }
    }
}

@available(Windows, introduced: 10.0.18362)
extension Device {
    typealias RawValue6 = WinSDK.ID3D12Device6
    convenience init(_ rawValue: inout RawValue6) {
        self.init(win32Pointer: &rawValue)
    }
}
@available(Windows, introduced: 10.0.18362)
extension Device.RawValue6 {
    static var interfaceID: IID {WinSDK.IID_ID3D12Device6}
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(Windows, introduced: 10.0.18362)
@available(*, deprecated, renamed: "Device")
public typealias ID3D12Device6 = Device

@available(Windows, introduced: 10.0.18362)
public extension Device {
    @available(*, unavailable, renamed: "setBackgroundProcessingMode")
    func SetBackgroundProcessingMode(_ Mode: Any,
                                     _ MeasurementsAction: Any,
                                     _ hEventToSignalUponCompletion: Any,
                                     _ pbFurtherMeasurementsDesired: inout Any) -> HRESULT {
        fatalError("This API is here to make migration easier. There is no implementation.")
    }
}

#endif
