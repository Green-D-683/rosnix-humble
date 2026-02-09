{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo-plugins,
  gazebo-ros,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "aws_robomaker_small_warehouse_world";
  version = "1.0.5-1";
  src = finalAttrs.passthru.sources."aws_robomaker_small_warehouse_world";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ gazebo-plugins gazebo-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "gazebo" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ gazebo-plugins gazebo-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gazebo" ]; };
  passthru.sources = mkSourceSet (sources: {
    "aws_robomaker_small_warehouse_world" = substituteSource {
      src = fetchgit {
        name = "aws_robomaker_small_warehouse_world-source";
        url = "https://github.com/ros2-gbp/aws_robomaker_small_warehouse_world-release.git";
        rev = "f9c9070e9cd91a1427854905bb1f46810f66d37d";
        hash = "sha256-bMYgLcTRb5UvNDZS4HmtCbd1SRpRfQypQmT4SJPbONY=";
      };
    };
  });
  meta = {
    description = "\n    AWS RoboMaker package for a warehouse world to use in manufacturing and logistics robot applications.\n  ";
  };
})
