{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "kuka_driver_interfaces";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."kuka_driver_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime ];
  passthru.sources = mkSourceSet (sources: {
    "kuka_driver_interfaces" = substituteSource {
      src = fetchgit {
        name = "kuka_driver_interfaces-source";
        url = "https://github.com/ros2-gbp/kuka_drivers-release.git";
        rev = "971ca980f30c2e87501045c9cb83143f8d22de15";
        hash = "sha256-Mt/SHhkgu8mpUo35iKTGuMBn4Hy7AaIQF25ToE7bU+I=";
      };
    };
  });
  meta = {
    description = "Message definitions necessary for using KUKA drivers";
  };
})
