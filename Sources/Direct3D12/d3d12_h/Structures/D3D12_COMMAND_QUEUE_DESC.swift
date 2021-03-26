/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK
import Direct3D12_Enumerations

/// Describes a command queue.
public struct D3DCommandQueueDescription {
    public typealias RawValue = WinSDK.D3D12_COMMAND_QUEUE_DESC
    internal var rawValue: RawValue

    /// Specifies one member of D3D12_COMMAND_LIST_TYPE.
    public var type: D3DCommandListType {
        get {
            return D3DCommandListType(rawValue: self.rawValue.Type)
        }
        set {
            self.rawValue.Type = newValue.rawValue
        }
    }

    /// The priority for the command queue, as a D3D12_COMMAND_QUEUE_PRIORITYenumeration constant to select normal or high priority.
    public var priority: D3DCommandQueuePriority {
        get {
            return D3DCommandQueuePriority(rawValue: self.rawValue.Priority)
        }
        set {
            self.rawValue.Priority = newValue.rawValue.rawValue
        }
    }

    /// Specifies any flags from the D3D12_COMMAND_QUEUE_FLAGS enumeration.
    public var flags: D3DCommandQueueFlags {
        get {
            return D3DCommandQueueFlags(rawValue: self.rawValue.Flags.rawValue)
        }
        set {
            self.rawValue.Flags = D3DCommandQueueFlags.RawType(newValue.rawValue)
        }
    }

    /// For single GPU operation, set this to zero. If there are multiple GPU nodes, set a bit to identify the node (the device's physical adapter) to which the command queue applies. Each bit in the mask corresponds to a single node. Only 1 bit must be set. Refer to Multi-adapter systems.
    public var multipleAdapterNodeMask: UInt32 {
        get {
            return self.rawValue.NodeMask
        }
        set {
            self.rawValue.NodeMask = newValue
        }
    }

    /** Describes a command queue.
    - parameter type: Specifies one member of D3D12_COMMAND_LIST_TYPE.
    - parameter priority: The priority for the command queue, as a D3D12_COMMAND_QUEUE_PRIORITYenumeration constant to select normal or high priority.
    - parameter flags: Specifies any flags from the D3D12_COMMAND_QUEUE_FLAGS enumeration.
    - parameter multipleAdapterNodeMask: For single GPU operation, set this to zero. If there are multiple GPU nodes, set a bit to identify the node (the device's physical adapter) to which the command queue applies. Each bit in the mask corresponds to a single node. Only 1 bit must be set. Refer to Multi-adapter systems.
    */
    public init(type: D3DCommandListType, priority: D3DCommandQueuePriority = .normal, flags: D3DCommandQueueFlags = [], multipleAdapterNodeMask: UInt32 = 0) {
        self.rawValue = RawValue()
        self.type = type
        self.priority = priority
        self.flags = flags
        self.multipleAdapterNodeMask = multipleAdapterNodeMask
    }

    internal init(_ rawValue: RawValue) {
        self.rawValue = rawValue
    }
}


//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, deprecated, renamed: "D3DCommandQueueDescription")
public typealias D3D12_COMMAND_QUEUE_DESC = D3DCommandQueueDescription 

#endif
