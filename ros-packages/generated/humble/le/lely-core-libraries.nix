{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "lely_core_libraries";
  version = "0.2.13-1";
  src = finalAttrs.passthru.sources."lely_core_libraries";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "autoconf" "automake" "git" "libtool" "python3-empy" "python3-yaml" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "autoconf" "automake" "git" "libtool" "python3-empy" "python3-yaml" ]; };
  passthru.sources = mkSourceSet (sources: {
    "lely_core_libraries" = substituteSource {
      src = fetchgit {
        name = "lely_core_libraries-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "0db366c416f1ed949643b803d6b952efa8376e46";
        hash = "sha256-ZSTwDYtsBdwT5tAv3bB9y1lAV2IyKO/0rhjglXSn5FM=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://gitlab.com/lely_industries/lely-core.git";
          to = "URL ${sources."lely_core_libraries/lely-core"}";
        }
      ];
    };
    "lely_core_libraries/lely-core" = substituteSource {
      src = fetchgit {
        name = "lely-core-source";
        url = "https://gitlab.com/lely_industries/lely-core.git";
        rev = "fb735b79cab5f0cdda45bc5087414d405ef8f3ab";
        hash = "sha256-ytMs2rENADW3zZdqQJvvVO98/zA5VFFMfdcQfVrA5Z0=";
      };
    };
  });
  meta = {
    description = "\n    ROS wrapper for lely-core-libraries\n  ";
  };
})
