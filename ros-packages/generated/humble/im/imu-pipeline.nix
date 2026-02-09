{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  imu-processors,
  imu-transformer,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "imu_pipeline";
  version = "0.4.1-1";
  src = finalAttrs.passthru.sources."imu_pipeline";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ imu-processors imu-transformer ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ imu-processors imu-transformer ];
  passthru.sources = mkSourceSet (sources: {
    "imu_pipeline" = substituteSource {
      src = fetchgit {
        name = "imu_pipeline-source";
        url = "https://github.com/ros2-gbp/imu_pipeline-release.git";
        rev = "e5450795df72c599f4b351edc13b128df5f4af5f";
        hash = "sha256-Stfof1r7uZTNTGVW0TV5Ck2J/V2ucskd+80gR7TSyDo=";
      };
    };
  });
  meta = {
    description = "imu_pipeline";
  };
})
