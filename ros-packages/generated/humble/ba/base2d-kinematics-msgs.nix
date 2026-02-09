{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "base2d_kinematics_msgs";
  version = "0.2.0-1";
  src = finalAttrs.passthru.sources."base2d_kinematics_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-default-generators rosidl-default-runtime ];
  passthru.sources = mkSourceSet (sources: {
    "base2d_kinematics_msgs" = substituteSource {
      src = fetchgit {
        name = "base2d_kinematics_msgs-source";
        url = "https://github.com/ros2-gbp/metro_nav-release.git";
        rev = "bd769df3b94e921f84aeba82cc2d1c6505c5c253";
        hash = "sha256-3sJLR0lx+7jybIEgFf7IzDI5DVJygb9TDuzGED8nzas=";
      };
    };
  });
  meta = {
    description = "Interfaces for 2.5D kinematics";
  };
})
