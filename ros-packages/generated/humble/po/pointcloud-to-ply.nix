{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "pointcloud_to_ply";
  version = "0.0.2-3";
  src = finalAttrs.passthru.sources."pointcloud_to_ply";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclpy sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-open3d" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclpy sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-open3d" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "pointcloud_to_ply" = substituteSource {
      src = fetchgit {
        name = "pointcloud_to_ply-source";
        url = "https://github.com/li9i/pointcloud-to-ply-release.git";
        rev = "4791da8b4f00e9754382d8151e9e097776a99d5e";
        hash = "sha256-5DMew2nawnR6hiqPQriR1Mq7+tm7R7l2K48ZRIKGvk0=";
      };
    };
  });
  meta = {
    description = "Subscribe to a PointCloud2 topic, reconstruct a mesh, and save to OBJ/PLY.";
  };
})
