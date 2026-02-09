{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle-msgs,
  mkSourceSet,
  rclcpp-lifecycle,
  ros-testing,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "lifecycle";
  version = "0.20.8-1";
  src = finalAttrs.passthru.sources."lifecycle";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ lifecycle-msgs rclcpp-lifecycle std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ lifecycle-msgs rclcpp-lifecycle std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ros-testing ];
  passthru.sources = mkSourceSet (sources: {
    "lifecycle" = substituteSource {
      src = fetchgit {
        name = "lifecycle-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "964a3187dc37db4b13e5b148a6e5ea8547522c55";
        hash = "sha256-EDFKPdlYjrjEyiI/NN1H8n9YHYLts2NCU/nl7UUBJc4=";
      };
    };
  });
  meta = {
    description = "Package containing demos for lifecycle implementation";
  };
})
