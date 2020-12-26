
import WinSDK
import SwiftCOM

//TODO: Replace these with the equivalent implimentation from SwiftCOM

fileprivate var E_INVALIDARG: HRESULT {
    HRESULT(bitPattern: 0x80070057)
}

extension SwiftCOM.IUnknown {
    /// Exposes the COM pointer and WinSDK Type through a closure.
    /// This is boiler plate for implimentations
    /// -Parameter type: The WinSDK Type
    final internal func performComOperation<T, ReturnType>(_ type: T.Type, _ operation: (_ this: T, _ pThis: UnsafeMutablePointer<T>) throws -> ReturnType) throws -> ReturnType {
        guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
            throw COMError(hr: E_INVALIDARG)
        }
        let pThis = pUnk.bindMemory(to: type, capacity: 1)
        return try operation(pThis.pointee, pThis)
    }

    /// Exposes the COM pointer and WinSDK Type through a closure.
    /// Automatically throws `hresult` when != S_OK
    /// This is boiler plate for implimentations
    /// -Parameter type: The WinSDK Type
    final internal func performComOperation<T, ReturnType>(_ type: T.Type, _ operation: (_ this: T, _ pThis: UnsafeMutablePointer<T>, _ hresult: inout HRESULT?) throws -> ReturnType) throws -> ReturnType {
        guard let pUnk = UnsafeMutableRawPointer(self.pUnk) else {
            throw COMError(hr: E_INVALIDARG)
        }
        let pThis = pUnk.bindMemory(to: type, capacity: 1)
        var hr: HRESULT? = nil
        let val = try operation(pThis.pointee, pThis, &hr)
        if let hr = hr, hr != S_OK {
            throw COMError(hr: hr)
        }
        return val
    }

    /// Returns the COM pointer for the WinSDK Type provided.
    /// This is boiler plate for implimentations
    /// - Parameter type: The WinSDK Type
    /// - Returns: A com pointer for `type`
    final internal func getThisPointer<T>(_ type: T.Type) throws -> UnsafeMutablePointer<T> {
        return try self.performComOperation(type) { (this, pThis) in
            return pThis
        }
    }
}