{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "game_controller_spl_interfaces";
  version = "2.2.0-2";
  src = finalAttrs.passthru.sources."game_controller_spl_interfaces";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "game_controller_spl_interfaces" = substituteSource {
      src = fetchgit {
        name = "game_controller_spl_interfaces-source";
        url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
        rev = "a95ab3b74c387b88ebcb2a6fcec35a5dd4b6abed";
        hash = "sha256-XpfIxX195mku8g0toxwI3HeKEXLbo03KBti4kdoGgAM=";
      };
    };
  });
  meta = {
    description = "RoboCup SPL GameController Data ROS msg";
  };
})
