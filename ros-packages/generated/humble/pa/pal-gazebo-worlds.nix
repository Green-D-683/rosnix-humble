{
  ament-cmake,
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-pal,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pal_gazebo_worlds";
  version = "4.10.0-1";
  src = finalAttrs.passthru.sources."pal_gazebo_worlds";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-auto launch-pal ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-auto launch-pal ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "pal_gazebo_worlds" = substituteSource {
      src = fetchgit {
        name = "pal_gazebo_worlds-source";
        url = "https://github.com/pal-gbp/pal_gazebo_worlds-ros2-release.git";
        rev = "4db6a17531805c2fe0c5a4c8a20f4ff94b7733b4";
        hash = "sha256-6LlTuxLBFOWjusXHAYAXy1JKxBabXMsoSiwwv9Clgq8=";
      };
    };
  });
  meta = {
    description = "Simulation worlds for PAL robots.";
  };
})
