{
  ament-cmake,
  ament-cmake-test,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros2cli,
  rosSystemPackages,
  sros2,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "sros2_cmake";
  version = "0.10.8-1";
  src = finalAttrs.passthru.sources."sros2_cmake";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-test ros2cli sros2 ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-test ros2cli sros2 ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "sros2_cmake" = substituteSource {
      src = fetchgit {
        name = "sros2_cmake-source";
        url = "https://github.com/ros2-gbp/sros2-release.git";
        rev = "bf7fa2017529f9c0b0218874aa8445d806e78fd4";
        hash = "sha256-6fYOcMcUMC4wyOB62aDdZ1XzdvC6er0S/EKigpTGBK8=";
      };
    };
  });
  meta = {
    description = "CMake macros to configure security";
  };
})
