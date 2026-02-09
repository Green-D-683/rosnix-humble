{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  grid-map-cmake-helpers,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  rosidl-default-generators,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "grid_map_msgs";
  version = "2.0.1-1";
  src = finalAttrs.passthru.sources."grid_map_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs grid-map-cmake-helpers rclcpp rosidl-default-generators std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs grid-map-cmake-helpers rclcpp rosidl-default-generators std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "grid_map_msgs" = substituteSource {
      src = fetchgit {
        name = "grid_map_msgs-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "008eff2d557ad22aa3b22e93bb0e635eedcf2027";
        hash = "sha256-8s099G5sTeCNledtMHQF2q2hiLndZFpBO9zBO8E1rm4=";
      };
    };
  });
  meta = {
    description = "Definition of the multi-layered grid map message type.";
  };
})
