{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pcl-conversions,
  pcl-msgs,
  pcl-ros,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "perception_pcl";
  version = "2.4.5-2";
  src = finalAttrs.passthru.sources."perception_pcl";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ pcl-conversions pcl-msgs pcl-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ pcl-conversions pcl-msgs pcl-ros ];
  passthru.sources = mkSourceSet (sources: {
    "perception_pcl" = substituteSource {
      src = fetchgit {
        name = "perception_pcl-source";
        url = "https://github.com/ros2-gbp/perception_pcl-release.git";
        rev = "b6242bf91a997177f98f28df3bcde0cab0762f61";
        hash = "sha256-p8+Izcu+CaeF++53kASsW2jyNZZ4lDpOwIhtYYVTBgY=";
      };
    };
  });
  meta = {
    description = "\n  PCL (Point Cloud Library) ROS interface stack. PCL-ROS is the preferred\n  bridge for 3D applications involving n-D Point Clouds and 3D geometry\n  processing in ROS.\n  ";
  };
})
