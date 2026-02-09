{
  ament-cmake,
  ament-cmake-pytest,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  as2-core,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  ros-gz-bridge,
  ros-gz-interfaces,
  ros-gz-sim,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "as2_gazebo_assets";
  version = "1.1.3-1";
  src = finalAttrs.passthru.sources."as2_gazebo_assets";
  nativeBuildInputs = [ ament-cmake ament-cmake-pytest ament-cmake-python ];
  propagatedNativeBuildInputs = [ as2-core geometry-msgs rclcpp ros-gz-bridge ros-gz-interfaces ros-gz-sim sensor-msgs tf2-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-jinja2" "python3-pydantic" ]; };
  buildInputs = [ ament-cmake ament-cmake-pytest ament-cmake-python ];
  propagatedBuildInputs = [ as2-core geometry-msgs rclcpp ros-gz-bridge ros-gz-interfaces ros-gz-sim sensor-msgs tf2-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-jinja2" "python3-pydantic" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "as2_gazebo_assets" = substituteSource {
      src = fetchgit {
        name = "as2_gazebo_assets-source";
        url = "https://github.com/ros2-gbp/aerostack2-release.git";
        rev = "c35af8f65878fa41b380d4154e0c2bf8188fe90a";
        hash = "sha256-91J5uMZozHnIKtAXZiCLa6uQMybYkLO9VHiL+LQ2OdU=";
      };
    };
  });
  meta = {
    description = "Ignition Gazebo resources";
  };
})
