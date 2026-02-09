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
  pname = "splsm_7";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."splsm_7";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "splsm_7" = substituteSource {
      src = fetchgit {
        name = "splsm_7-source";
        url = "https://github.com/ros2-gbp/r2r_spl-release.git";
        rev = "416dd5df31b5b99c316a9b921719a89c41482240";
        hash = "sha256-ii6OJV44dmTv1hb+syEw4Q4C4WO52VVPlTtjfP5YdEY=";
      };
    };
  });
  meta = {
    description = "RoboCup Standard Platform League Standard Message V7 ROS msg";
  };
})
