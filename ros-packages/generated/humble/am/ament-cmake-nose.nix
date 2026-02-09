{
  ament-cmake-core,
  ament-cmake-test,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_nose";
  version = "1.3.13-1";
  src = finalAttrs.passthru.sources."ament_cmake_nose";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-test ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-nose" ]; };
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-test ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-nose" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_nose" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_nose-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "8eb9174690120c9723f1ff88305e609302f38ec9";
        hash = "sha256-CS7vRqc9qCBAWT99US03DESwyKFgJzMppaVThbLAB2M=";
      };
    };
  });
  meta = {
    description = "The ability to add nose-based tests in the ament buildsystem in CMake.";
  };
})
