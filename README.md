<p align="center">
    <img 
        src="https://user-images.githubusercontent.com/1342803/59471117-1c77b300-8e08-11e9-838e-441b280855b3.png" 
        height="64" 
        alt="JWTKit"
    >
    <br>
    <br>
    <a href="LICENSE">
        <img src="http://img.shields.io/badge/license-MIT-brightgreen.svg" alt="MIT License">
    </a>
    <a href="https://swift.org">
        <img src="http://img.shields.io/badge/swift-5.2-brightgreen.svg" alt="Swift 5.2">
    </a>
</p>


<hr>

This is a somewhat permanent fork of Vapor's [JWTKit](https://github.com/vapor/jwt-kit). The purpose of this fork is to add support for iOS. As such the only differences are:
1. **Does not** include the custom built `CCryptoBoringSSL` variant called `CJWTKitBoringSSL`. 
2. Supports iOS/watchOS/tvOS

## Basic usage

```swift
import Foundation
import JWTKit

public struct AppJWTSigner {
    private let identity: Identity

    public func jwt(_ audience: Audience) throws -> String {
        let signer = try JWTSigner.rs256(key: .private(pem: identity.privateKey.bytes))
        let payload = Payload(iss: IssuerClaim(value: identity.clientEmail),
                              sub: SubjectClaim(value: identity.clientEmail),
                              aud: AudienceClaim(value: audience.rawValue),
                              iat: IssuedAtClaim(value: Date()),
                              exp: ExpirationClaim(value: Date().addingTimeInterval(3600)))

        let signers = JWTSigners()
        signers.use(signer, kid: JWKIdentifier(string: identity.privateKeyID), isDefault: true)

        return try signers.sign(payload)
    }

    public init(_ data: Data) throws {
        self.identity = try JSONDecoder().decode(Identity.self, from: data)
    }
}
```

**Original author**

- Siemen Sikkema, [@siemensikkema](http://github.com/siemensikkema)  
