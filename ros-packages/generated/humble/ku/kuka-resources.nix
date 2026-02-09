{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  urdf,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "kuka_resources";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."kuka_resources";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ urdf xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ urdf xacro ];
  passthru.sources = mkSourceSet (sources: {
    "kuka_resources" = substituteSource {
      src = fetchgit {
        name = "kuka_resources-source";
        url = "https://github.com/ros2-gbp/kuka_robot_descriptions-release.git";
        rev = "8e5ae5e4f30a3bd0b4e2f2a58be244712d522183";
        hash = "sha256-A+fbBTSt2yd5yq8Bg+kM9rqCPBg4yytcxVaZLXHOcgo=";
      };
    };
  });
  meta = {
    description = "This package contains common urdf / xacro resources used by KUKA robot support packages within the ROS-Industrial program.";
  };
})
