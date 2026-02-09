{
  ament-cmake-python,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  vimbax-camera-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "vimbax_camera_events";
  version = "1.0.2-1";
  src = finalAttrs.passthru.sources."vimbax_camera_events";
  nativeBuildInputs = [ ament-cmake-python ament-cmake-ros vimbax-camera-msgs ];
  propagatedNativeBuildInputs = [ rclcpp ];
  buildInputs = [ ament-cmake-python ament-cmake-ros vimbax-camera-msgs ];
  propagatedBuildInputs = [ rclcpp ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "vimbax_camera_events" = substituteSource {
      src = fetchgit {
        name = "vimbax_camera_events-source";
        url = "https://github.com/ros2-gbp/vimbax_ros2_driver-release.git";
        rev = "27adda723eb3820a79cb1498883201a70e0fc467";
        hash = "sha256-7tNbPysPYo68rQieGzajc+puGLCzoeLVQdINmksdnHU=";
      };
    };
  });
  meta = {
    description = "Vimba X event support library";
  };
})
