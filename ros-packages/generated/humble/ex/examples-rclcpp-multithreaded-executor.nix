{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "examples_rclcpp_multithreaded_executor";
  version = "0.15.5-1";
  src = finalAttrs.passthru.sources."examples_rclcpp_multithreaded_executor";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "examples_rclcpp_multithreaded_executor" = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_multithreaded_executor-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "73afe4f8aa066ea99786ef853f6834bc9df72bd0";
        hash = "sha256-viMT6rtA7dafhnRU2jwMFTRKh1Qb7w0hRZ4NSWzq5IU=";
      };
    };
  });
  meta = {
    description = "Package containing example of how to implement a multithreaded executor";
  };
})
