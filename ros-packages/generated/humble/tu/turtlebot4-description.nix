{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  irobot-create-description,
  joint-state-publisher,
  mkSourceSet,
  robot-state-publisher,
  rosSystemPackages,
  substituteSource,
  urdf,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot4_description";
  version = "1.0.5-1";
  src = finalAttrs.passthru.sources."turtlebot4_description";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ irobot-create-description joint-state-publisher robot-state-publisher urdf ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ irobot-create-description joint-state-publisher robot-state-publisher urdf ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot4_description" = substituteSource {
      src = fetchgit {
        name = "turtlebot4_description-source";
        url = "https://github.com/ros2-gbp/turtlebot4-release.git";
        rev = "8ef30de134581fe06795fd95959fc43f37844169";
        hash = "sha256-jwXqVb98y1VCy7AfHLhf+DJNWzkGNAgFXT7Z17fxQdA=";
      };
    };
  });
  meta = {
    description = "Turtlebot4 Description package";
  };
})
