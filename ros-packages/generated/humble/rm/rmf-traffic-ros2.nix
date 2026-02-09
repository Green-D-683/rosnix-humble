{
  ament-cmake,
  ament-cmake-catch2,
  ament-cmake-uncrustify,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rmf-building-map-msgs,
  rmf-fleet-msgs,
  rmf-site-map-msgs,
  rmf-traffic,
  rmf-traffic-msgs,
  rmf-utils,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_traffic_ros2";
  version = "2.1.8-1";
  src = finalAttrs.passthru.sources."rmf_traffic_ros2";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp rmf-building-map-msgs rmf-fleet-msgs rmf-site-map-msgs rmf-traffic rmf-traffic-msgs rmf-utils ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "nlohmann-json-dev" "proj" "uuid" "yaml-cpp" "zlib" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rmf-building-map-msgs rmf-fleet-msgs rmf-site-map-msgs rmf-traffic rmf-traffic-msgs rmf-utils ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "nlohmann-json-dev" "proj" "uuid" "yaml-cpp" "zlib" ]; };
  checkInputs = [ ament-cmake-catch2 ament-cmake-uncrustify ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_traffic_ros2" = substituteSource {
      src = fetchgit {
        name = "rmf_traffic_ros2-source";
        url = "https://github.com/ros2-gbp/rmf_ros2-release.git";
        rev = "0fd3803de40176be5847078592bee3d054dd4026";
        hash = "sha256-6AtJ/uCiM8QsXxgkhHRbNWWWKv4aOscZAgTzmEyw5CI=";
      };
    };
  });
  meta = {
    description = "A package containing messages used by the RMF traffic management system.";
  };
})
