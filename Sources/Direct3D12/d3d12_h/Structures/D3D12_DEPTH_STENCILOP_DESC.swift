/**
 * Copyright (c) 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK
import Direct3D12_Enumerations

/// Describes stencil operations that can be performed based on the results of stencil test.
public struct D3DDepthStencilOperationDescription {
    public typealias RawValue = WinSDK.D3D12_DEPTH_STENCILOP_DESC
    internal var rawValue: RawValue

    /// A D3D12_STENCIL_OP-typed value that identifies the stencil operation to perform when stencil testing fails.
    public var failureOperation: D3DStencilOperation {
        get {
            return D3DStencilOperation(rawValue.StencilFailOp)
        }
        set {
            rawValue.StencilFailOp = newValue.rawValue
        }
    }

    /// A D3D12_STENCIL_OP-typed value that identifies the stencil operation to perform when stencil testing passes and depth testing fails.
    public var depthFailureOperation: D3DStencilOperation {
        get {
            return D3DStencilOperation(rawValue.StencilDepthFailOp)
        }
        set {
            rawValue.StencilDepthFailOp = newValue.rawValue
        }
    }

    /// A D3D12_STENCIL_OP-typed value that identifies the stencil operation to perform when stencil testing and depth testing both pass.
    public var successOperation: D3DStencilOperation {
        get {
            return D3DStencilOperation(rawValue.StencilPassOp)
        }
        set {
            rawValue.StencilPassOp = newValue.rawValue
        }
    }

    /// A D3D12_COMPARISON_FUNC-typed value that identifies the function that compares stencil data against existing stencil data.
    public var comparisonFunction: D3DComparisonFunction {
        get {
            return D3DComparisonFunction(rawValue.StencilFunc)
        }
        set {
            rawValue.StencilFunc = newValue.rawValue
        }
    }

    /** Describes stencil operations that can be performed based on the results of stencil test.
    - parameter failureOperation: A D3D12_STENCIL_OP-typed value that identifies the stencil operation to perform when stencil testing fails.
    - parameter depthFailureOperation: A D3D12_STENCIL_OP-typed value that identifies the stencil operation to perform when stencil testing passes and depth testing fails.
    - parameter successOperation: A D3D12_STENCIL_OP-typed value that identifies the stencil operation to perform when stencil testing and depth testing both pass.
    - parameter comparisonFunction: A D3D12_COMPARISON_FUNC-typed value that identifies the function that compares stencil data against existing stencil data.
    */
    public init(failureOperation: D3DStencilOperation, 
                depthFailureOperation: D3DStencilOperation, 
                successOperation: D3DStencilOperation, 
                comparisonFunction: D3DComparisonFunction) {
        self.rawValue = RawValue()
        self.failureOperation = failureOperation
        self.depthFailureOperation = depthFailureOperation
        self.successOperation = successOperation
        self.comparisonFunction = comparisonFunction
    }

    /// Describes stencil operations that can be performed based on the results of stencil test.
    public init() {
        self.rawValue = RawValue()
    }

    internal init(_ rawValue: RawValue) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "D3DDepthStencilOperationDescription")
public typealias D3D12_DEPTH_STENCILOP_DESC = D3DDepthStencilOperationDescription

#endif
