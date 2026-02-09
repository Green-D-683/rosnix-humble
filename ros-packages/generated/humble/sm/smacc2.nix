{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcl,
  rclcpp,
  rclcpp-action,
  rosSystemPackages,
  smacc2-msgs,
  substituteSource,
  tracetools,
  tracetools-launch,
  tracetools-trace,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "smacc2";
  version = "2.3.20-2";
  src = finalAttrs.passthru.sources."smacc2";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rcl rclcpp rclcpp-action smacc2-msgs tracetools tracetools-launch tracetools-trace ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libboost-thread" "libboost-thread-dev" "liblttng-ust-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rcl rclcpp rclcpp-action smacc2-msgs tracetools tracetools-launch tracetools-trace ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-thread" "libboost-thread-dev" "liblttng-ust-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "smacc2" = substituteSource {
      src = fetchgit {
        name = "smacc2-source";
        url = "https://github.com/robosoft-ai/SMACC2-release.git";
        rev = "c4edfde9159cec56a1b33f84cdba49812d00455e";
        hash = "sha256-m/TrG/188fc+83A21g3BE3pSmSsqu4iT2ncXaFiImHM=";
      };
    };
  });
  meta = {
    description = "An Event-Driven, Asynchronous, Behavioral State Machine Library for ROS2 (Robotic Operating System) applications written in C++.";
  };
})
