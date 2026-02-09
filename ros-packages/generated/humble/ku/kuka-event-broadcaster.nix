{
  ament-cmake,
  buildAmentCmakePackage,
  controller-interface,
  fetchgit,
  fetchurl,
  fetchzip,
  kuka-drivers-core,
  mkSourceSet,
  pluginlib,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "kuka_event_broadcaster";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."kuka_event_broadcaster";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ controller-interface kuka-drivers-core pluginlib ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-interface kuka-drivers-core pluginlib ];
  passthru.sources = mkSourceSet (sources: {
    "kuka_event_broadcaster" = substituteSource {
      src = fetchgit {
        name = "kuka_event_broadcaster-source";
        url = "https://github.com/ros2-gbp/kuka_drivers-release.git";
        rev = "91884bb40053df61364cb3aa6eaf05aeb271a44f";
        hash = "sha256-SqQ/hAAubZtPa/vljqbDOw4EBXONO1dRzCu8rPm8aTg=";
      };
    };
  });
  meta = {
    description = "Broadcaster of hardware events of KUKA robots";
  };
})
