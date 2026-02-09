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
  pname = "rcgcrd_spl_4";
  version = "2.2.0-2";
  src = finalAttrs.passthru.sources."rcgcrd_spl_4";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rcgcrd_spl_4" = substituteSource {
      src = fetchgit {
        name = "rcgcrd_spl_4-source";
        url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
        rev = "7fef4dfcaf63a39d9ac2ab9023f16c2ecebefd0f";
        hash = "sha256-nCxEPqXiYZpjrovBOEg6qduXk0/I2Ox5p+OFJ1x8RSM=";
      };
    };
  });
  meta = {
    description = "RoboCup SPL GameController Return Data V4 ROS msg";
  };
})
