{
  agnocast-sample-interfaces,
  agnocastlib,
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "agnocast_sample_application";
  version = "2.1.2-1";
  src = finalAttrs.passthru.sources."agnocast_sample_application";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ agnocast-sample-interfaces agnocastlib rclcpp rclcpp-components ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ agnocast-sample-interfaces agnocastlib rclcpp rclcpp-components ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "agnocast_sample_application" = substituteSource {
      src = fetchgit {
        name = "agnocast_sample_application-source";
        url = "https://github.com/ros2-gbp/agnocast-release.git";
        rev = "cb6a71ae11e41fb2b3ebcb3552ca7c4f3fff47d6";
        hash = "sha256-iYObHfrqHkKM3nrmfEtzKBFoLEh6hy73Vk9vMn3cTj0=";
      };
    };
  });
  meta = {
    description = "\n    A sample application for Agnocast.\n  ";
  };
})
