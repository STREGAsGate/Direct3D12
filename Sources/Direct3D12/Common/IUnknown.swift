/**
 * Copyright (c) 2020 - 2021 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import WinSDK

public class IUnknown {
    internal class var interfaceID: WinSDK.IID {preconditionFailure("Must override!")}

    private var win32Pointer: UnsafeMutableRawPointer?
    struct ComManager<WinSDKType> {
        public let pThis: UnsafeMutablePointer<WinSDKType>
        public var this: WinSDKType {
            return pThis.pointee
        }

        fileprivate init(comObject: IUnknown, sdkType: WinSDKType.Type) throws {
            guard let pUnk = comObject.win32Pointer else {throw Error(.E_INVALIDARG)}
            pThis = pUnk.bindMemory(to: sdkType, capacity: 1)
        }

        func pointer<T>(to comObject: IUnknown, as pType: T.Type) throws -> UnsafeMutablePointer<T> {
            guard let pUnk = comObject.win32Pointer else {throw Error(.E_INVALIDARG)}
            return pUnk.bindMemory(to: pType, capacity: 1)
        }

        func checkResult(isMemberOf passable: Set<HRESULT>, _ body: @autoclosure () -> HRESULT) throws {
            let hr: HRESULT = body()
            guard passable.contains(hr) else {throw Error(hr)}
        }
        func checkResult(is passable: HRESULT = .S_OK, _ body: @autoclosure () -> HRESULT) throws {
            let hr: HRESULT = body()
            guard hr == passable else {throw Error(hr)}
        }
    }

    func perform<Type, ResultType>(as type: Type.Type, _ body: (_ com: ComManager<Type>) throws -> ResultType) throws -> ResultType {
        return try body(try ComManager<Type>(comObject: self, sdkType: type))
    }

    func performFatally<Type, ResultType>(as type: Type.Type, _ body: (_ com: ComManager<Type>) throws -> ResultType) -> ResultType {
        do {
            return try body(try ComManager<Type>(comObject: self, sdkType: type))
        }catch let error as Direct3D12.Error {
            fatalError(error.description)
        }catch{
            fatalError("\(error)")
        }
    }

    init(win32Pointer: UnsafeMutableRawPointer?) {
        self.win32Pointer = win32Pointer
    }
}
