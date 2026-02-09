{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rqt-gui,
  rqt-gui-py,
  rqt-py-common,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_service_caller";
  version = "1.0.5-3";
  src = finalAttrs.passthru.sources."rqt_service_caller";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ rqt-gui rqt-gui-py rqt-py-common ];
  propagatedBuildInputs = [ rqt-gui rqt-gui-py rqt-py-common ];
  passthru.sources = mkSourceSet (sources: {
    "rqt_service_caller" = substituteSource {
      src = fetchgit {
        name = "rqt_service_caller-source";
        url = "https://github.com/ros2-gbp/rqt_service_caller-release.git";
        rev = "0e31ca73773890dede6e92dc4a97b02d0716e975";
        hash = "sha256-ZIAMenPCiVlqoXUvFI0pukwPJC43v4GOkQH7JEHO9W4=";
      };
    };
  });
  meta = {
    description = "rqt_service_caller provides a GUI plugin for calling arbitrary services.";
  };
})
