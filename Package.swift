// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "TensorFlowLiteTaskAccura",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "TensorFlowLiteTaskVision",
            targets: ["TensorFlowLiteTaskVision"]
        ),
    ],
    targets: [
        // Binary C library
        .binaryTarget(
            name: "TensorFlowLiteTaskVisionC",
            path: "Frameworks/TensorFlowLiteTaskVisionC.xcframework"
        ),

        // ObjC + headers wrapper
        .target(
            name: "TensorFlowLiteTaskVision",
            dependencies: [
                "TensorFlowLiteTaskVisionC"
            ],
            path: "tensorflow_lite_support",
            exclude: [
                // optional: exclude anything not needed
            ],
            publicHeadersPath: "ios/task/vision/apis",   // important
            cSettings: [
                // === THE CRITICAL FIX ===
                .headerSearchPath(".."),                 // parent of tensorflow_lite_support
                // Main folders
                .headerSearchPath("."),
                .headerSearchPath("c"),
                .headerSearchPath("c/task"),
                .headerSearchPath("c/task/core"),
                .headerSearchPath("c/task/processor"),
                .headerSearchPath("c/task/vision"),
                .headerSearchPath("c/task/vision/core"),
                // iOS ObjC headers
                .headerSearchPath("ios"),
                .headerSearchPath("ios/sources"),
                .headerSearchPath("ios/task/core/sources"),
                .headerSearchPath("ios/task/processor/sources"),
                .headerSearchPath("ios/task/vision/sources"),
                .headerSearchPath("ios/task/vision/apis"),
                .headerSearchPath("ios/task/vision/utils"),
                // === THIS IS THE MISSING ONE ===
                .headerSearchPath("odml/ios/image"),
                .headerSearchPath("odml/ios/image/apis"),
               .headerSearchPath("odml/ios/image/sources"),
            ],
            cxxSettings: [
                .headerSearchPath(".."),
                .headerSearchPath("."),
                .headerSearchPath("odml/ios/image"),
                .headerSearchPath("odml/ios/image/apis"),
            ],
            linkerSettings: [
                .linkedLibrary("c++"),
                .linkedFramework("UIKit"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("CoreVideo"),
                .linkedFramework("Foundation")
            ]
        )
    ]
)
