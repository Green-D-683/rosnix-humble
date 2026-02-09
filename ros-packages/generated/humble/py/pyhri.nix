{
  ament-cmake-auto,
  ament-cmake-pytest,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  hri,
  hri-msgs,
  mkSourceSet,
  pybind11-vendor,
  rclcpp,
  rclpy,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2-ros-py,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pyhri";
  version = "2.6.1-1";
  src = finalAttrs.passthru.sources."pyhri";
  nativeBuildInputs = [ ament-cmake-auto ament-cmake-python ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs hri pybind11-vendor rclcpp rclpy ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libopencv-dev" "python3-opencv" ]; };
  buildInputs = [ ament-cmake-auto ament-cmake-python ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs hri pybind11-vendor rclcpp rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" "python3-opencv" ]; };
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common cv-bridge geometry-msgs hri-msgs sensor-msgs std-msgs tf2-ros-py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" "python3-opencv" ]; };
  passthru.sources = mkSourceSet (sources: {
    "pyhri" = substituteSource {
      src = fetchgit {
        name = "pyhri-source";
        url = "https://github.com/ros4hri/libhri-release.git";
        rev = "2705e8f705e87f7eb5240e63fad5b6f3d47111cb";
        hash = "sha256-rcqk0JcJEyG12+KgG8Ogx9MMVGaDZykWwR+qpv6hDHI=";
      };
    };
  });
  meta = {
    description = "A python wrapper around hri package";
  };
})
