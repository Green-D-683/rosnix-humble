{
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  orocos-kdl-vendor,
  rcutils,
  rosSystemPackages,
  substituteSource,
  urdf,
  urdfdom-headers,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "kdl_parser";
  version = "2.6.4-1";
  src = finalAttrs.passthru.sources."kdl_parser";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ orocos-kdl-vendor rcutils urdf urdfdom-headers ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ orocos-kdl-vendor rcutils urdf urdfdom-headers ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "kdl_parser" = substituteSource {
      src = fetchgit {
        name = "kdl_parser-source";
        url = "https://github.com/ros2-gbp/kdl_parser-release.git";
        rev = "4eb29777669c335eafc1ea4664cdb3ed5e4b9880";
        hash = "sha256-JlyZxZY3C7AYQawxE/f0lwcAO0a15WccwufPv76ONOY=";
      };
    };
  });
  meta = {
    description = "\n   The Kinematics and Dynamics Library (KDL) defines a tree structure\n   to represent the kinematic and dynamic parameters of a robot\n   mechanism. ";
  };
})
