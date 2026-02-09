{
  ament-cmake,
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "wiimote_msgs";
  version = "3.3.0-1";
  src = finalAttrs.passthru.sources."wiimote_msgs";
  nativeBuildInputs = [ ament-cmake ament-cmake-auto rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ament-cmake-auto rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "wiimote_msgs" = substituteSource {
      src = fetchgit {
        name = "wiimote_msgs-source";
        url = "https://github.com/ros2-gbp/joystick_drivers-release.git";
        rev = "709b89d869b513cc206f12443e09018afc51826f";
        hash = "sha256-CTizMiNOKAwVd/bOq8yB5s7j00cvCsHVQotPLLXwrhI=";
      };
    };
  });
  meta = {
    description = "\n    Messages used by wiimote package.\n  ";
  };
})
