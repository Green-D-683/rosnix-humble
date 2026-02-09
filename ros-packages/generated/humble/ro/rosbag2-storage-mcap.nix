{
  ament-cmake,
  ament-cmake-clang-format,
  ament-cmake-gmock,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mcap-vendor,
  mkSourceSet,
  pluginlib,
  rcpputils,
  rcutils,
  rosSystemPackages,
  rosbag2-storage,
  rosbag2-storage-mcap-testdata,
  rosbag2-test-common,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbag2_storage_mcap";
  version = "0.15.16-1";
  src = finalAttrs.passthru.sources."rosbag2_storage_mcap";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-cpp mcap-vendor pluginlib rcutils rosbag2-storage ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp mcap-vendor pluginlib rcutils rosbag2-storage ];
  checkInputs = [ ament-cmake-clang-format ament-cmake-gmock ament-lint-auto ament-lint-common rcpputils rosbag2-storage-mcap-testdata rosbag2-test-common std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_storage_mcap" = substituteSource {
      src = fetchgit {
        name = "rosbag2_storage_mcap-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "9ab8ad955b0ce82b9bed32037e4a08b6354c7ff8";
        hash = "sha256-qB31whosB7HTOpEn3NcSY/pUaCVdGovi/nPNgQnHytw=";
      };
    };
  });
  meta = {
    description = "rosbag2 storage plugin using the MCAP file format";
  };
})
