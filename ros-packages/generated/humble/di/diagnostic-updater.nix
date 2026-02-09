{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-cmake-python,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  diagnostic-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-testing,
  launch-testing-ros,
  mkSourceSet,
  rclcpp,
  rclcpp-lifecycle,
  rclpy,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "diagnostic_updater";
  version = "4.0.6-1";
  src = finalAttrs.passthru.sources."diagnostic_updater";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ament-cmake-ros ];
  propagatedNativeBuildInputs = [ diagnostic-msgs rclcpp rclpy std-msgs ];
  buildInputs = [ ament-cmake ament-cmake-python ament-cmake-ros ];
  propagatedBuildInputs = [ diagnostic-msgs rclcpp rclpy std-msgs ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common launch launch-testing launch-testing-ros rclcpp-lifecycle ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "diagnostic_updater" = substituteSource {
      src = fetchgit {
        name = "diagnostic_updater-source";
        url = "https://github.com/ros2-gbp/diagnostics-release.git";
        rev = "b31256ddb7e588adc55d15d937fbae383cf56f48";
        hash = "sha256-xFMRSKH9hQ1Wf8RgsP+Y+WuHTq1m8OFwsWVYUP3uuEU=";
      };
    };
  });
  meta = {
    description = "diagnostic_updater contains tools for easily updating diagnostics. it is commonly used in device drivers to keep track of the status of output topics, device status, etc.";
  };
})
