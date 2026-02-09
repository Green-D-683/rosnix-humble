{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  octomap,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "dynamic_edt_3d";
  version = "1.9.8-1";
  src = finalAttrs.passthru.sources."dynamic_edt_3d";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ octomap ];
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ octomap ];
  passthru.sources = mkSourceSet (sources: {
    "dynamic_edt_3d" = substituteSource {
      src = fetchgit {
        name = "dynamic_edt_3d-source";
        url = "https://github.com/ros2-gbp/octomap-release.git";
        rev = "29c9ce0b0a49db5405883739ee1673e205511f1e";
        hash = "sha256-522JD7zQBjHhrle/McBU6igMD2aGFVJvyheYkpGEJ3g=";
      };
    };
  });
  meta = {
    description = " The dynamicEDT3D library implements an inrementally updatable Euclidean distance transform (EDT) in 3D. It comes with a wrapper to use the OctoMap 3D representation and hooks into the change detection of the OctoMap library to propagate changes to the EDT.";
  };
})
