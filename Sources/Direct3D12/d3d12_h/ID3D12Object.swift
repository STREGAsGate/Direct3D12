/**
 * Copyright (c) 2020 Dustin Collins (Strega's Gate)
 * All Rights Reserved.
 * Licensed under Apache License v2.0
 * 
 * Find me on YouTube as Strega's Gate, or social media @STREGAsGate
 */

import SwiftCOM
import _d3d12

///Gets application-defined data from a device object.
open class Object: SwiftCOM.IUnknown {
    override public class var IID: IID { IID_ID3D12Object }
}
