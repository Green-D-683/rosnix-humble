{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-cmake-python,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  metro-benchmark-msgs,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "metro_benchmark_pub";
  version = "0.1.1-1";
  src = finalAttrs.passthru.sources."metro_benchmark_pub";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ metro-benchmark-msgs rclcpp ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ metro-benchmark-msgs rclcpp ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ];
  passthru.sources = mkSourceSet (sources: {
    "metro_benchmark_pub" = substituteSource {
      src = fetchgit {
        name = "metro_benchmark_pub-source";
        url = "https://github.com/ros2-gbp/metrics_msgs-release.git";
        rev = "04cd3175c635d6e077a25d9aae3e1c5773e79272";
        hash = "sha256-HbH6TWjBM8kXgfj8PWOi3q5INg0iaghzo/MJylGUuwI=";
      };
    };
  });
  meta = {
    description = "Utilities for publishing / processing metro_benchmark_msgs";
  };
})
