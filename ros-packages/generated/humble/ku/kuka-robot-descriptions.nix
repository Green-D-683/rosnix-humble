{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  kuka-agilus-support,
  kuka-cybertech-support,
  kuka-fortec-support,
  kuka-iontec-support,
  kuka-kr-moveit-config,
  kuka-lbr-iisy-moveit-config,
  kuka-lbr-iisy-support,
  kuka-lbr-iiwa-moveit-config,
  kuka-lbr-iiwa-support,
  kuka-mock-hardware-interface,
  kuka-quantec-support,
  kuka-resources,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "kuka_robot_descriptions";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."kuka_robot_descriptions";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ kuka-agilus-support kuka-cybertech-support kuka-fortec-support kuka-iontec-support kuka-kr-moveit-config kuka-lbr-iisy-moveit-config kuka-lbr-iisy-support kuka-lbr-iiwa-moveit-config kuka-lbr-iiwa-support kuka-mock-hardware-interface kuka-quantec-support kuka-resources ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ kuka-agilus-support kuka-cybertech-support kuka-fortec-support kuka-iontec-support kuka-kr-moveit-config kuka-lbr-iisy-moveit-config kuka-lbr-iisy-support kuka-lbr-iiwa-moveit-config kuka-lbr-iiwa-support kuka-mock-hardware-interface kuka-quantec-support kuka-resources ];
  passthru.sources = mkSourceSet (sources: {
    "kuka_robot_descriptions" = substituteSource {
      src = fetchgit {
        name = "kuka_robot_descriptions-source";
        url = "https://github.com/ros2-gbp/kuka_robot_descriptions-release.git";
        rev = "5d2395166bc728729989bdcb31db14d03bc0a81a";
        hash = "sha256-wirfVsiSWqRb9qjYjz7QchSNkFAMicjJ5s0Y6U7n5Rw=";
      };
    };
  });
  meta = {
    description = "Robot descriptions and moveit configurations for KUKA robots";
  };
})
