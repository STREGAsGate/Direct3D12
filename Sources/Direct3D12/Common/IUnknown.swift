/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on https://www.YouTube.com/STREGAsGate, or social media @STREGAsGate
 */

import WinSDK

public class IUnknown {
    private let pUnk: UnsafeMutableRawPointer

    func perform<Type, ResultType>(as type: Type.Type, body: (_ pThis: UnsafeMutablePointer<Type>) throws -> ResultType) rethrows -> ResultType {
        let pThis = pUnk.bindMemory(to: Type.self, capacity: 1)
        return try body(pThis)
    }

    func performFatally<Type, ResultType>(as type: Type.Type, body: (_ pThis: UnsafeMutablePointer<Type>) throws -> ResultType) -> ResultType {
        do {
            let pThis = pUnk.bindMemory(to: Type.self, capacity: 1)
            return try body(pThis)
        }catch let error as Direct3D12.Error {
            fatalError(error.description)
        }catch{
            fatalError("\(error)")
        }
    }

    internal enum MemoryManagment {
        case alreadyRetained
        case retain
    }

    internal init?(winSDKPointer pointer: UnsafeMutableRawPointer?, memoryManagment: MemoryManagment = .alreadyRetained) {
        guard let pointer = pointer else {return nil}
        self.pUnk = pointer
        if memoryManagment == .retain {
            self.retain()
        }
    }

    internal func retain() {
        self.performFatally(as: WinSDK.IUnknown.self) {pThis in
            _ = pThis.pointee.lpVtbl.pointee.AddRef(pThis)
        }
    }

    internal func release() {
        self.performFatally(as: WinSDK.IUnknown.self) {pThis in
            _ = pThis.pointee.lpVtbl.pointee.Release(pThis)
        }
    }

    public func fullRelease() {
        self.performFatally(as: WinSDK.IUnknown.self) {pThis in
            while pThis.pointee.lpVtbl.pointee.Release(pThis) > 0 {}
        }
    }

    deinit {
        self.release()
    }
    
    class var interfaceID: WinSDK.IID {preconditionFailure("Must override!")}
}

extension IUnknown {
    typealias RawValue = WinSDK.IUnknown
}
extension IUnknown.RawValue {
    static var interfaceID: WinSDK.IID {WinSDK.IID_IUnknown}
}