{
  ament-cmake,
  base2d-kinematics-msgs,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-2d-msgs,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "base2d_kinematics";
  version = "0.2.0-1";
  src = finalAttrs.passthru.sources."base2d_kinematics";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ base2d-kinematics-msgs geometry-msgs nav-2d-msgs rclcpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ base2d-kinematics-msgs geometry-msgs nav-2d-msgs rclcpp ];
  passthru.sources = mkSourceSet (sources: {
    "base2d_kinematics" = substituteSource {
      src = fetchgit {
        name = "base2d_kinematics-source";
        url = "https://github.com/ros2-gbp/metro_nav-release.git";
        rev = "596fe0db3224aae00523fd21607a9ea171f5a6b7";
        hash = "sha256-jKh8CzkLaGmIvEw+kJLHz+DYk65IGUtVDLz0/JNi+/E=";
      };
    };
  });
  meta = {
    description = "Implementation of simple kinematics in two and half dimensions";
  };
})
