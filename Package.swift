// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "jwt-kit",
    platforms: [.iOS(.v13),
                .watchOS(.v6),
                .tvOS(.v13),
                .macOS(.v10_15)
    ],
    products: [
        .library(name: "JWTKit", targets: ["JWTKit"]),
        /* This target is used only for symbol mangling. It's added and removed automatically because it emits build warnings. MANGLE_START
        .library(name: "CCryptoBoringSSL", type: .static, targets: ["CCryptoBoringSSL"]),
        MANGLE_END */
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-crypto.git", from: "1.0.0")
    ],
    targets: [
        .target(name: "JWTKit", dependencies: [
            .product(name: "Crypto", package: "swift-crypto"),
        ]),
        .testTarget(name: "JWTKitTests", dependencies: [
            .target(name: "JWTKit"),
        ]),
    ]
)
