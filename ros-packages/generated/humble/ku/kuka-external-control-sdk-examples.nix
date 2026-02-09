{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  kuka-external-control-sdk,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "kuka_external_control_sdk_examples";
  version = "1.4.1-1";
  src = finalAttrs.passthru.sources."kuka_external_control_sdk_examples";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake kuka-external-control-sdk ];
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ ament-cmake kuka-external-control-sdk ];
  passthru.sources = mkSourceSet (sources: {
    "kuka_external_control_sdk_examples" = substituteSource {
      src = fetchgit {
        name = "kuka_external_control_sdk_examples-source";
        url = "https://github.com/ros2-gbp/kuka_external_control_sdk-release.git";
        rev = "6f3d183bbb357178ebf1df9d77d109df21c66b15";
        hash = "sha256-2afU52LUPuAX7iwNQZiRd2mmScIJGawG2cQyit1BxXk=";
      };
    };
  });
  meta = {
    description = "Examples for using KUKA external control SDK";
  };
})
