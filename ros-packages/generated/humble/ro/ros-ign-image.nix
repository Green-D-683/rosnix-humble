{
  ament-cmake,
  ament-index-cpp,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-gz-image,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros_ign_image";
  version = "0.244.21-1";
  src = finalAttrs.passthru.sources."ros_ign_image";
  nativeBuildInputs = [ ament-cmake ament-index-cpp ];
  propagatedNativeBuildInputs = [ ros-gz-image ];
  buildInputs = [ ament-cmake ament-index-cpp ];
  propagatedBuildInputs = [ ros-gz-image ];
  passthru.sources = mkSourceSet (sources: {
    "ros_ign_image" = substituteSource {
      src = fetchgit {
        name = "ros_ign_image-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "b382edda26f8f11dd53bdd6c6649f6b42a7028c7";
        hash = "sha256-FboxdOEJW9V8VDosSnTnkUMmhnWrXZlGtW2JrWFFWjg=";
      };
    };
  });
  meta = {
    description = "Shim package to redirect to ros_gz_image.";
  };
})
