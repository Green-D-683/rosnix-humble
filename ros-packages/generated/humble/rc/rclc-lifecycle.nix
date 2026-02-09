{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle-msgs,
  mkSourceSet,
  osrf-testing-tools-cpp,
  rcl-lifecycle,
  rclc,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rclc_lifecycle";
  version = "4.0.2-3";
  src = finalAttrs.passthru.sources."rclc_lifecycle";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ lifecycle-msgs rcl-lifecycle rclc std-msgs ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ lifecycle-msgs rcl-lifecycle rclc std-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common osrf-testing-tools-cpp ];
  passthru.sources = mkSourceSet (sources: {
    "rclc_lifecycle" = substituteSource {
      src = fetchgit {
        name = "rclc_lifecycle-source";
        url = "https://github.com/ros2-gbp/rclc-release.git";
        rev = "ceaa532f70039c4db8886f4a40300bab466f7938";
        hash = "sha256-FhlL210r7p//YsaTVrhSC1apBMGYtGF04fe2Uv46030=";
      };
    };
  });
  meta = {
    description = "rclc lifecycle convenience methods.";
  };
})
