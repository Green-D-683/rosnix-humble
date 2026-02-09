{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  iiqka-moveit-example,
  kuka-controllers,
  kuka-driver-interfaces,
  kuka-drivers-core,
  kuka-iiqka-eac-driver,
  kuka-rsi-driver,
  kuka-rsi-simulator,
  kuka-sunrise-fri-driver,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "kuka_drivers";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."kuka_drivers";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ iiqka-moveit-example kuka-controllers kuka-driver-interfaces kuka-drivers-core kuka-iiqka-eac-driver kuka-rsi-driver kuka-rsi-simulator kuka-sunrise-fri-driver ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ iiqka-moveit-example kuka-controllers kuka-driver-interfaces kuka-drivers-core kuka-iiqka-eac-driver kuka-rsi-driver kuka-rsi-simulator kuka-sunrise-fri-driver ];
  passthru.sources = mkSourceSet (sources: {
    "kuka_drivers" = substituteSource {
      src = fetchgit {
        name = "kuka_drivers-source";
        url = "https://github.com/ros2-gbp/kuka_drivers-release.git";
        rev = "eefc03f3cc473ddc67a2a92bf2757ff04a1d6666";
        hash = "sha256-K9YCwU/l9rbcDtUhq0lagNomiJcxfBoqeZaFFG2jTxQ=";
      };
    };
  });
  meta = {
    description = "ROS2 drivers for KUKA robots";
  };
})
