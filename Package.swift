// swift-tools-version:5.10
import PackageDescription

let package = Package(
    name: "SKConnectivity",
    platforms: [
        .iOS(.v12),
        .tvOS(.v12),
        .macOS(.v10_13)
    ],
    products: [
        .library(
            name: "SKConnectivity",
            targets: ["SKConnectivity"]
        )
    ],
    targets: [
        .target(
            name: "SKConnectivity",
            dependencies: ["SKReachability"],
            path: "Connectivity/Classes",
            exclude: ["Reachability"],
            swiftSettings: [.define("IMPORT_REACHABILITY")]
        ),
        .target(
            name: "SKReachability",
            dependencies: [],
            path: "Connectivity/Classes/Reachability",
            publicHeadersPath: "",
            cSettings: [
                .headerSearchPath("Connectivity/Classes/Reachability")
            ]
        )
    ]
)
