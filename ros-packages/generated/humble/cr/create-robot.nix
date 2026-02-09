{
  ament-cmake,
  buildAmentCmakePackage,
  create-bringup,
  create-description,
  create-driver,
  create-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "create_robot";
  version = "3.1.0-1";
  src = finalAttrs.passthru.sources."create_robot";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ create-bringup create-description create-driver create-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ create-bringup create-description create-driver create-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "create_robot" = substituteSource {
      src = fetchgit {
        name = "create_robot-source";
        url = "https://github.com/AutonomyLab/create_autonomy-release.git";
        rev = "80b307df7ec7b775fea09917a06e1a2b313b3154";
        hash = "sha256-we7mLpPQSBnPqtlCN0oYlFUD1AFzkw8PHAV7sBCYoF8=";
      };
    };
  });
  meta = {
    description = "ROS driver for iRobot's Create 1 and 2, based on the libcreate C++ library";
  };
})
