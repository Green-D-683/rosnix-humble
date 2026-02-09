{
  action-msgs,
  ament-cmake,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic-msgs,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "as2_msgs";
  version = "1.1.3-1";
  src = finalAttrs.passthru.sources."as2_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ action-msgs builtin-interfaces geographic-msgs geometry-msgs nav-msgs rclcpp rosidl-default-generators rosidl-default-runtime sensor-msgs std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces geographic-msgs geometry-msgs nav-msgs rclcpp rosidl-default-generators rosidl-default-runtime sensor-msgs std-msgs ];
  checkInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "as2_msgs" = substituteSource {
      src = fetchgit {
        name = "as2_msgs-source";
        url = "https://github.com/ros2-gbp/aerostack2-release.git";
        rev = "97d5a36fcd42bcea6f2b7493a5af11c55a5c61f5";
        hash = "sha256-v0XxRLe5a7mnSPdlkuRQXHIuorEaMOY4w+dligcPTEI=";
      };
    };
  });
  meta = {
    description = "Messages, services and action files for the AS2 stack";
  };
})
