#define BEGIN_INTERFACE
#define END_INTERFACE

#define interface struct

#define THIS_ INTERFACE FAR* This,
#define THIS  INTERFACE FAR* This

typedef struct tagRECT {
    long left;
    long top;
    long right;
    long bottom;
} RECT;

#define REFIID const IID * __MIDL_CONST

typedef unsigned int UINT;

typedef long HRESULT;

typedef struct IUnknownVtbl IUnknownVtbl;
typedef struct IUnknown IUnknown;

typedef enum DXGI_FORMAT DXGI_FORMAT;