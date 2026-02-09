{
  action-msgs,
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
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbag2_storage_mcap_testdata";
  version = "0.15.16-1";
  src = finalAttrs.passthru.sources."rosbag2_storage_mcap_testdata";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ action-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_storage_mcap_testdata" = substituteSource {
      src = fetchgit {
        name = "rosbag2_storage_mcap_testdata-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "d7459009882e532f00de7d1a9b512a1444e601a8";
        hash = "sha256-4usVEvqFpzXE+q3Zn7uEAKkwg2faTLHC5MErYuK8wIo=";
      };
    };
  });
  meta = {
    description = "message definition test fixtures for MCAP schema recording";
  };
})
