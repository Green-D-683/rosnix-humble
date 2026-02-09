{
  ament-cmake,
  ament-cmake-gmock,
  ament-cmake-gtest,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  foros-msgs,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "foros";
  version = "0.4.1-2";
  src = finalAttrs.passthru.sources."foros";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ foros-msgs rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "leveldb" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ foros-msgs rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "leveldb" ]; };
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "foros" = substituteSource {
      src = fetchgit {
        name = "foros-source";
        url = "https://github.com/ros2-gbp/foros-release.git";
        rev = "d5b07dc63208f826b6f351ad1014c96113d1bf23";
        hash = "sha256-3MdLSjVHhSt+I/aMjeUl177ZcPCBGL84NQFFCx4YlP4=";
      };
    };
  });
  meta = {
    description = "Fail Over ROS framework";
  };
})
