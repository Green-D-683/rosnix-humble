{
  ament-cmake,
  ament-cmake-pytest,
  ament-cmake-python,
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentCmakePackage,
  crazyflie-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "crazyflie_sim";
  version = "1.0.3-1";
  src = finalAttrs.passthru.sources."crazyflie_sim";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ crazyflie-interfaces rclpy ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ crazyflie-interfaces rclpy ];
  checkInputs = [ ament-cmake-pytest ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "crazyflie_sim" = substituteSource {
      src = fetchgit {
        name = "crazyflie_sim-source";
        url = "https://github.com/ros2-gbp/crazyswarm2-release.git";
        rev = "ec252b72562ffd4ae868293a5567624ddf23d377";
        hash = "sha256-OZfOAJbk8hBEID4NRGi9XDDA8oO4ZJXctBOmsVBzI5A=";
      };
    };
  });
  meta = {
    description = "Simulator for the Crazyswarm2 ROS stack";
  };
})
