{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-cmake,
  autoware-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_signal_processing";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_signal_processing";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libboost-dev" ]; };
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ geometry-msgs rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-dev" ]; };
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_signal_processing" = substituteSource {
      src = fetchgit {
        name = "autoware_signal_processing-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "be3bd28d2ad7b9549f9c99bbf1e5ae92e6f6faaa";
        hash = "sha256-Nf9SUixi5Aezw6VpdhazWnb7eOuL9irfQ8j0LmJctYs=";
      };
    };
  });
  meta = {
    description = "The signal processing package";
  };
})
