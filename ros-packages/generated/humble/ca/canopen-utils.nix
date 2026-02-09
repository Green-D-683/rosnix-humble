{
  ament-lint-auto,
  buildAmentPythonPackage,
  canopen-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle-msgs,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "canopen_utils";
  version = "0.2.13-1";
  src = finalAttrs.passthru.sources."canopen_utils";
  propagatedNativeBuildInputs = [ canopen-interfaces lifecycle-msgs rclpy std-msgs ];
  propagatedBuildInputs = [ canopen-interfaces lifecycle-msgs rclpy std-msgs ];
  checkInputs = [ ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "canopen_utils" = substituteSource {
      src = fetchgit {
        name = "canopen_utils-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "251e20653bf524a7d016b942636e6d1fbb6a02c2";
        hash = "sha256-NEW3eaEzMTF9X0yE6eIGaeg5jaf7rMgHJJLunodXPNk=";
      };
    };
  });
  meta = {
    description = "Utils for working with ros2_canopen.";
  };
})
