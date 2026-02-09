{
  action-msgs,
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  bond,
  bondcpp,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  launch,
  launch-testing-ament-cmake,
  launch-testing-ros,
  lifecycle-msgs,
  mkSourceSet,
  nav-msgs,
  nav2-common,
  nav2-msgs,
  rcl-interfaces,
  rclcpp,
  rclcpp-action,
  rclcpp-lifecycle,
  rosSystemPackages,
  std-srvs,
  substituteSource,
  test-msgs,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_util";
  version = "1.1.20-1";
  src = finalAttrs.passthru.sources."nav2_util";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ action-msgs bond bondcpp geometry-msgs launch launch-testing-ament-cmake lifecycle-msgs nav2-common nav2-msgs nav-msgs rcl-interfaces rclcpp rclcpp-action rclcpp-lifecycle tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libboost-program-options" "libboost-program-options-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ action-msgs bond bondcpp geometry-msgs launch launch-testing-ament-cmake lifecycle-msgs nav2-common nav2-msgs nav-msgs rcl-interfaces rclcpp rclcpp-action rclcpp-lifecycle tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-program-options" "libboost-program-options-dev" ]; };
  checkInputs = [ action-msgs ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common launch launch-testing-ament-cmake launch-testing-ros std-srvs test-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_util" = substituteSource {
      src = fetchgit {
        name = "nav2_util-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "070d67d563cb83f1bbdbcbacdc0ae07bc29dab19";
        hash = "sha256-Oe9rnyQSkrJC/IhUXOdIvW318G8dK6A9VljRijbws3c=";
      };
    };
  });
  meta = {
    description = "TODO";
  };
})
