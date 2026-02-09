{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pal_urdf_utils";
  version = "2.3.3-1";
  src = finalAttrs.passthru.sources."pal_urdf_utils";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ xacro ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ xacro ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "pal_urdf_utils" = substituteSource {
      src = fetchgit {
        name = "pal_urdf_utils-source";
        url = "https://github.com/ros2-gbp/pal_urdf_utils-release.git";
        rev = "60ef30ea0842d96ccb33e11ccf1b78e1017c7b79";
        hash = "sha256-8TD76sEtILCEvDP5Q0PtzHYxsNWc41rVnWr00iuOF3c=";
      };
    };
  });
  meta = {
    description = "This package contains the color materials of common elements of PAL Robotics' robot.\n      The files in this package are parsed and used by\n      a variety of other components.  Most users will not interact directly\n      with this package.";
  };
})
