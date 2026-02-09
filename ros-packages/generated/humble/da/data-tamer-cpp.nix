{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  data-tamer-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mcap-vendor,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "data_tamer_cpp";
  version = "0.9.3-2";
  src = finalAttrs.passthru.sources."data_tamer_cpp";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ data-tamer-msgs mcap-vendor rclcpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ data-tamer-msgs mcap-vendor rclcpp ];
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "data_tamer_cpp" = substituteSource {
      src = fetchgit {
        name = "data_tamer_cpp-source";
        url = "https://github.com/ros2-gbp/data_tamer-release.git";
        rev = "cf1563eb8bbe000145137ad86fdca1fa47635da0";
        hash = "sha256-JKRlUHutk0nQ6UxEWVklJII/g5giySpZUMfAET8HP+0=";
      };
    };
  });
  meta = {
    description = "\n  DataTamer data logging library\n  ";
  };
})
