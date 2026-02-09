{
  ament-cmake,
  buildAmentCmakePackage,
  crane-plus-control,
  crane-plus-description,
  crane-plus-examples,
  crane-plus-gazebo,
  crane-plus-moveit-config,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "crane_plus";
  version = "2.0.1-1";
  src = finalAttrs.passthru.sources."crane_plus";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ crane-plus-control crane-plus-description crane-plus-examples crane-plus-gazebo crane-plus-moveit-config ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ crane-plus-control crane-plus-description crane-plus-examples crane-plus-gazebo crane-plus-moveit-config ];
  passthru.sources = mkSourceSet (sources: {
    "crane_plus" = substituteSource {
      src = fetchgit {
        name = "crane_plus-source";
        url = "https://github.com/ros2-gbp/crane_plus-release.git";
        rev = "2000776fbfae0026c328aa3a72359071c5484d0a";
        hash = "sha256-Lbvvb2nbBaqxXwiRHQUhm+oHVOoiK5WLgNqb2N9vImA=";
      };
    };
  });
  meta = {
    description = "ROS 2 package suite of CRANE+ V2";
  };
})
