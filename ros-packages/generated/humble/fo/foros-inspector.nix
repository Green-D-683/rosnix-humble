{
  ament-cmake,
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
  pname = "foros_inspector";
  version = "0.4.1-2";
  src = finalAttrs.passthru.sources."foros_inspector";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ foros-msgs rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libncurses-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ foros-msgs rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libncurses-dev" ]; };
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "foros_inspector" = substituteSource {
      src = fetchgit {
        name = "foros_inspector-source";
        url = "https://github.com/ros2-gbp/foros-release.git";
        rev = "a8f99a4dade3f6db666dd7b2627ba50f59a03d8e";
        hash = "sha256-WfePxLQcvtxpQxBIDPXuPTGMb87E/ySncvdid1KfFFk=";
      };
    };
  });
  meta = {
    description = "Fail over ROS inspector";
  };
})
