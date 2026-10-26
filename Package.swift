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
        .binaryTarget(
            name: "TensorFlowLiteTaskVisionC",
            path: "Frameworks/TensorFlowLiteTaskVisionC.xcframework"
        ),
        .target(
            name: "TensorFlowLiteTaskVision",
            dependencies: [
                "TensorFlowLiteTaskVisionC"
            ],
            path: "tensorflow_lite_support",
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath(".."),
                .headerSearchPath("ios"),
                .headerSearchPath("ios/sources"),
                .headerSearchPath("ios/task/core/sources"),
                .headerSearchPath("ios/task/processor/sources"),
                .headerSearchPath("ios/task/vision/sources"),
                .headerSearchPath("ios/task/vision/apis"),
                .headerSearchPath("odml/ios/image"),
                .headerSearchPath("odml/ios/image/apis"),
                .headerSearchPath("c"),
                .headerSearchPath("c/task"),
                .headerSearchPath("c/task/core"),
                .headerSearchPath("c/task/processor"),
                .headerSearchPath("c/task/vision"),
            ],
            cxxSettings: [
                .headerSearchPath(".."),
                .headerSearchPath("ios"),
                .headerSearchPath("ios/sources"),
                .headerSearchPath("ios/task/core/sources"),
                .headerSearchPath("ios/task/processor/sources"),
                .headerSearchPath("ios/task/vision/sources"),
                .headerSearchPath("ios/task/vision/apis"),
                .headerSearchPath("odml/ios/image"),
                .headerSearchPath("odml/ios/image/apis"),
                .headerSearchPath("c"),
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