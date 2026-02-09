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
  pname = "splsm_8";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."splsm_8";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "splsm_8" = substituteSource {
      src = fetchgit {
        name = "splsm_8-source";
        url = "https://github.com/ros2-gbp/r2r_spl-release.git";
        rev = "fee7b4cd6ab28fed5b71bb4a46ad8420bcff534f";
        hash = "sha256-NQtHPGs/nlAs266SyTZ4ICD0IPF8OWObP/zDL+H7olc=";
      };
    };
  });
  meta = {
    description = "RoboCup Standard Platform League Standard Message V8 ROS msg";
  };
})
