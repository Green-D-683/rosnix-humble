{
  ament-cmake,
  ament-cmake-copyright,
  ament-cmake-cpplint,
  ament-cmake-lint-cmake,
  ament-cmake-uncrustify,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "leo_gz_plugins";
  version = "1.1.2-1";
  src = finalAttrs.passthru.sources."leo_gz_plugins";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "gz-plugin" "gz-sim6" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "gz-plugin" "gz-sim6" ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-cpplint ament-cmake-lint-cmake ament-cmake-uncrustify ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "leo_gz_plugins" = substituteSource {
      src = fetchgit {
        name = "leo_gz_plugins-source";
        url = "https://github.com/ros2-gbp/leo_simulator-release.git";
        rev = "e5ebbb0b886c8bb87e9cc744ae4a1967ee06332a";
        hash = "sha256-Nbzs25Ur/UuEQeW2Umq7XbZlrnTSkREF3W+g1BOlMYw=";
      };
    };
  });
  meta = {
    description = "Plugins for Leo Rover Gazebo simulation in ROS 2";
  };
})
