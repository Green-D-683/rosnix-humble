{
  ament-index-python,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rmf-building-map-msgs,
  rmf-site-map-msgs,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rmf_building_map_tools";
  version = "1.6.3-1";
  src = finalAttrs.passthru.sources."rmf_building_map_tools";
  propagatedNativeBuildInputs = [ ament-index-python rclpy rmf-building-map-msgs rmf-site-map-msgs std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "ignition-fuel-tools7" "python3-fiona" "python3-pyproj" "python3-requests" "python3-rtree" "python3-shapely" "python3-yaml" "sqlite3" "yaml-cpp" ]; };
  propagatedBuildInputs = [ ament-index-python rclpy rmf-building-map-msgs rmf-site-map-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "ignition-fuel-tools7" "python3-fiona" "python3-pyproj" "python3-requests" "python3-rtree" "python3-shapely" "python3-yaml" "sqlite3" "yaml-cpp" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rmf_building_map_tools" = substituteSource {
      src = fetchgit {
        name = "rmf_building_map_tools-source";
        url = "https://github.com/ros2-gbp/rmf_traffic_editor-release.git";
        rev = "9b9ee71f0a0dbfcd0ea54d318800709dde125d20";
        hash = "sha256-whbcNMtMIzc5zydlR38B4Cu/oqM3W7d5Tsu4ei+3dTw=";
      };
    };
  });
  meta = {
    description = "RMF Building map tools";
  };
})
