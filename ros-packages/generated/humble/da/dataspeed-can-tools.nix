{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  can-msgs,
  dataspeed-can-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  rosbag2-cpp,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "dataspeed_can_tools";
  version = "2.0.6-1";
  src = finalAttrs.passthru.sources."dataspeed_can_tools";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ can-msgs dataspeed-can-msgs rclcpp rosbag2-cpp std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ can-msgs dataspeed-can-msgs rclcpp rosbag2-cpp std-msgs ];
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "dataspeed_can_tools" = substituteSource {
      src = fetchgit {
        name = "dataspeed_can_tools-source";
        url = "https://github.com/DataspeedInc-release/dataspeed_can-release.git";
        rev = "b6c60e8b0163f6e3c92e27b41c8c99b6a2542814";
        hash = "sha256-jd8Vs5LsDnpTmrB0EXhGyMUn78KIsfwHbxcT7oIoOHc=";
      };
    };
  });
  meta = {
    description = "\n    CAN bus introspection\n  ";
  };
})
