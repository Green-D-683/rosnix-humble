{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  diagnostic-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  laser-filters,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rclcpp-lifecycle,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "sicks300_2";
  version = "1.3.3-1";
  src = finalAttrs.passthru.sources."sicks300_2";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ diagnostic-msgs laser-filters rclcpp rclcpp-components rclcpp-lifecycle sensor-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ diagnostic-msgs laser-filters rclcpp rclcpp-components rclcpp-lifecycle sensor-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "sicks300_2" = substituteSource {
      src = fetchgit {
        name = "sicks300_2-source";
        url = "https://github.com/ros2-gbp/sicks300_ros2-release.git";
        rev = "3786e33fedf70b31f48608fd24f0a1d87bcc5d9e";
        hash = "sha256-CNpZaRgVYOod9jHd8XwZSOsyppwSNbfFbk9DfaqKofE=";
      };
    };
  });
  meta = {
    description = "This package published a laser scan message out of a Sick S300 laser scanner.";
  };
})
