/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK
import Direct3D12_Enumerations

public class CommandList: DeviceChild {
    /// Gets the type of the command list, such as direct, bundle, compute, or copy.
    public var commandListType: CommandListType {
        performFatally(as: RawValue.self) {
            CommandListType(rawValue: $0.this.lpVtbl.pointee.GetType($0.pThis))
        }
    }

    override class var interfaceID: WinSDK.IID {RawValue.interfaceID}
}

extension CommandList {
    typealias RawValue = WinSDK.ID3D12CommandList
    private var rawValue: RawValue {self.performFatally(as: RawValue.self, {$0.this})}
    convenience init(_ rawValue: inout RawValue) {
        self.init(win32Pointer: &rawValue)
    }
}
extension CommandList.RawValue {
    static var interfaceID: IID {WinSDK.IID_ID3D12CommandList}
}

//MARK: - Original Style API
#if !Direct3D12ExcludeOriginalStyleAPI

@available(*, unavailable, renamed: "CommandList")
public typealias ID3D12CommandList = CommandList 

public extension CommandList {
    @available(*, unavailable, renamed: "commandListType")
    func GetType() -> CommandListType.RawValue {fatalError("This API is here to make migration easier. There is no implimnetation.")
}
}

#endif
