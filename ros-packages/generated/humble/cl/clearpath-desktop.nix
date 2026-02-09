{
  ament-cmake,
  buildAmentCmakePackage,
  clearpath-config-live,
  clearpath-platform-msgs,
  clearpath-viz,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "clearpath_desktop";
  version = "1.2.0-1";
  src = finalAttrs.passthru.sources."clearpath_desktop";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ clearpath-config-live clearpath-platform-msgs clearpath-viz ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ clearpath-config-live clearpath-platform-msgs clearpath-viz ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_desktop" = substituteSource {
      src = fetchgit {
        name = "clearpath_desktop-source";
        url = "https://github.com/clearpath-gbp/clearpath_desktop-release.git";
        rev = "b8eabb777c5b83ead8469217b481ccc86ffa7508";
        hash = "sha256-oOvXYY0jvdhZD6BVe6YjL2gBdpHe5+aK+2mu0X3xnyI=";
      };
    };
  });
  meta = {
    description = "Packages for working with Clearpath Platforms from a ROS 2 desktop.";
  };
})
