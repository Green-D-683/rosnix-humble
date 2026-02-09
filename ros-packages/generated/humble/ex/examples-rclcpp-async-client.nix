{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "examples_rclcpp_async_client";
  version = "0.15.5-1";
  src = finalAttrs.passthru.sources."examples_rclcpp_async_client";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ example-interfaces rclcpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ example-interfaces rclcpp ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "examples_rclcpp_async_client" = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_async_client-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "96f77dd2ec20db047bf432ddf306a27f2040a702";
        hash = "sha256-44B0Y5g4XkjfQtCacKn5FqybNhWiiPd7olRCm3D1N8Y=";
      };
    };
  });
  meta = {
    description = "Example of an async service client";
  };
})
