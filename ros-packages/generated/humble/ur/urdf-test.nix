{
  ament-cmake-auto,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "urdf_test";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."urdf_test";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ rclpy ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "liburdfdom-tools" ]; };
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "liburdfdom-tools" ]; };
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common launch xacro ];
  passthru.sources = mkSourceSet (sources: {
    "urdf_test" = substituteSource {
      src = fetchgit {
        name = "urdf_test-source";
        url = "https://github.com/pal-gbp/urdf_test-ros2-gbp.git";
        rev = "c5405f677345375954d739764bcf6945c2bcfcf6";
        hash = "sha256-GBwZ/gwhR92dDboQIt3p83X7OyHK8mMWw/RVjZDjREQ=";
      };
    };
  });
  meta = {
    description = "The urdf_test package";
  };
})
