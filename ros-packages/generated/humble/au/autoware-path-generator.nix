{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-cmake,
  autoware-internal-planning-msgs,
  autoware-lanelet2-extension,
  autoware-lint-common,
  autoware-motion-utils,
  autoware-planning-msgs,
  autoware-planning-test-manager,
  autoware-test-utils,
  autoware-trajectory,
  autoware-utils-debug,
  autoware-utils-system,
  autoware-vehicle-info-utils,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_path_generator";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_path_generator";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-internal-planning-msgs autoware-lanelet2-extension autoware-motion-utils autoware-planning-msgs autoware-planning-test-manager autoware-trajectory autoware-utils-debug autoware-utils-system autoware-vehicle-info-utils generate-parameter-library rclcpp rclcpp-components ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-internal-planning-msgs autoware-lanelet2-extension autoware-motion-utils autoware-planning-msgs autoware-planning-test-manager autoware-trajectory autoware-utils-debug autoware-utils-system autoware-vehicle-info-utils generate-parameter-library rclcpp rclcpp-components ];
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common autoware-test-utils ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_path_generator" = substituteSource {
      src = fetchgit {
        name = "autoware_path_generator-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "f71e3af98439919c6a08216bd26a2cdeca2740c8";
        hash = "sha256-sBHMp9eCskklIlOrsusUd8OWXl9PU84eXeoNPeGYB7w=";
      };
    };
  });
  meta = {
    description = "The autoware_path_generator package";
  };
})
