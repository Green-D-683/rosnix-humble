{
  ament-cmake,
  buildAmentCmakePackage,
  depthai,
  depthai-bridge,
  depthai-descriptions,
  depthai-examples,
  depthai-filters,
  depthai-ros-driver,
  depthai-ros-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "depthai-ros";
  version = "2.12.2-1";
  src = finalAttrs.passthru.sources."depthai-ros";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ depthai depthai-bridge depthai-descriptions depthai-examples depthai-filters depthai-ros-driver depthai-ros-msgs ros-environment ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ depthai depthai-bridge depthai-descriptions depthai-examples depthai-filters depthai-ros-driver depthai-ros-msgs ros-environment ];
  passthru.sources = mkSourceSet (sources: {
    "depthai-ros" = substituteSource {
      src = fetchgit {
        name = "depthai-ros-source";
        url = "https://github.com/luxonis/depthai-ros-release.git";
        rev = "ca34ba6c3f026cbb5caaaaf9bde7b33591cc31c7";
        hash = "sha256-8YZ5TsJj7twSN+bpYjbr1NuckC+6FbVaXNqsMXZ/cjU=";
      };
    };
  });
  meta = {
    description = "The depthai-ros package";
  };
})
