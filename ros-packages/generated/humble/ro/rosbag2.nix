{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros2bag,
  rosSystemPackages,
  rosbag2-compression,
  rosbag2-compression-zstd,
  rosbag2-cpp,
  rosbag2-py,
  rosbag2-storage,
  rosbag2-storage-default-plugins,
  rosbag2-test-common,
  rosbag2-tests,
  rosbag2-transport,
  shared-queues-vendor,
  sqlite3-vendor,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbag2";
  version = "0.15.16-1";
  src = finalAttrs.passthru.sources."rosbag2";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros2bag rosbag2-compression rosbag2-compression-zstd rosbag2-cpp rosbag2-py rosbag2-storage rosbag2-storage-default-plugins rosbag2-transport shared-queues-vendor sqlite3-vendor ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ros2bag rosbag2-compression rosbag2-compression-zstd rosbag2-cpp rosbag2-py rosbag2-storage rosbag2-storage-default-plugins rosbag2-transport shared-queues-vendor sqlite3-vendor ];
  checkInputs = [ rosbag2-test-common rosbag2-tests ];
  passthru.sources = mkSourceSet (sources: {
    "rosbag2" = substituteSource {
      src = fetchgit {
        name = "rosbag2-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "36c7c65ba2e8c54b00420fba680ea94dde6c65d2";
        hash = "sha256-wzNwhnLSCIWPrUYdJvWIuIYmoH/vGqMsElKbHzxGWYI=";
      };
    };
  });
  meta = {
    description = "Meta package for rosbag2 related packages";
  };
})
