{
  ament-cmake,
  ament-cmake-gmock,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  tracetools,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "agnocastlib";
  version = "2.1.2-1";
  src = finalAttrs.passthru.sources."agnocastlib";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp rclcpp-components std-msgs tracetools ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "liblttng-ust-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rclcpp-components std-msgs tracetools ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "liblttng-ust-dev" ]; };
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "agnocastlib" = substituteSource {
      src = fetchgit {
        name = "agnocastlib-source";
        url = "https://github.com/ros2-gbp/agnocast-release.git";
        rev = "7ba3475d856fdee4e25cde0092493e813d451339";
        hash = "sha256-gSr17a9PHBGghV2cLpNia67TZE6ncVaroWY7U//+E04=";
      };
    };
  });
  meta = {
    description = "\n    True Zero Copy Communication Middleware for Unsized ROS 2 Message Types.\n  ";
  };
})
