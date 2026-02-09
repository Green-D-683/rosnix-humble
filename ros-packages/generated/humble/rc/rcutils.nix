{
  ament-cmake-gmock,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-testing,
  launch-testing-ament-cmake,
  mimick-vendor,
  mkSourceSet,
  osrf-testing-tools-cpp,
  performance-test-fixture,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rcutils";
  version = "5.1.8-1";
  src = finalAttrs.passthru.sources."rcutils";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-empy" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "libatomic" ]; };
  buildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-empy" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libatomic" ]; };
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common launch launch-testing launch-testing-ament-cmake mimick-vendor osrf-testing-tools-cpp performance-test-fixture ];
  passthru.sources = mkSourceSet (sources: {
    "rcutils" = substituteSource {
      src = fetchgit {
        name = "rcutils-source";
        url = "https://github.com/ros2-gbp/rcutils-release.git";
        rev = "759c6b7183b230c8ec2e8f70d0915ecb51244432";
        hash = "sha256-7zywS9kb/B7SoYox2hxANTr1LFer862XXTdA7vfXipE=";
      };
    };
  });
  meta = {
    description = "Package containing various utility types and functions for C";
  };
})
