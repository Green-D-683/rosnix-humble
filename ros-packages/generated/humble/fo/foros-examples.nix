{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  foros,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  std-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "foros_examples";
  version = "0.4.1-2";
  src = finalAttrs.passthru.sources."foros_examples";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ foros rclcpp std-msgs std-srvs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ foros rclcpp std-msgs std-srvs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "foros_examples" = substituteSource {
      src = fetchgit {
        name = "foros_examples-source";
        url = "https://github.com/ros2-gbp/foros-release.git";
        rev = "6ee5fffae4ee5fa9f21e792a9a83423479337693";
        hash = "sha256-wLenaUPYkbTfpUgwP8XyuWRNs7BK+w8XocDjCmIAEZo=";
      };
    };
  });
  meta = {
    description = "Fail over ROS examples";
  };
})
