{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nav2-util,
  opennav-docking-msgs,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "opennav_docking_core";
  version = "0.0.2-4";
  src = finalAttrs.passthru.sources."opennav_docking_core";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ nav2-util opennav-docking-msgs rclcpp rclcpp-lifecycle ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ nav2-util opennav-docking-msgs rclcpp rclcpp-lifecycle ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "opennav_docking_core" = substituteSource {
      src = fetchgit {
        name = "opennav_docking_core-source";
        url = "https://github.com/open-navigation/opennav_docking-release.git";
        rev = "e3c499abca5cbebc009c05f9195422f696599784";
        hash = "sha256-r1sDio8gOpguE0+mJ2WqRam32C2BcfWx+F1cp6WzITg=";
      };
    };
  });
  meta = {
    description = "A set of headers for plugins core to the opennav docking framework";
  };
})
