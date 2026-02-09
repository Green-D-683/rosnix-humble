{
  ament-cmake,
  ament-cmake-gtest,
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-ros,
  mkSourceSet,
  robot-state-publisher,
  rosSystemPackages,
  substituteSource,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "bcr_bot";
  version = "1.0.2-2";
  src = finalAttrs.passthru.sources."bcr_bot";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-python launch launch-ros robot-state-publisher xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-python launch launch-ros robot-state-publisher xacro ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "bcr_bot" = substituteSource {
      src = fetchgit {
        name = "bcr_bot-source";
        url = "https://github.com/blackcoffeerobotics/bcr_bot_ros2-release.git";
        rev = "c25b4fd4d7873b066aaed03516792d7bbe741bf2";
        hash = "sha256-sGPeKJ8KQtniieDLCiRQlupx8NxQKHg+Y/yWzSeut/E=";
      };
    };
  });
  meta = {
    description = "bcr_bot";
  };
})
