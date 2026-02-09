{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joy-teleop,
  key-teleop,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  teleop-tools-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "teleop_tools";
  version = "1.7.0-1";
  src = finalAttrs.passthru.sources."teleop_tools";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ joy-teleop key-teleop teleop-tools-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ joy-teleop key-teleop teleop-tools-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "teleop_tools" = substituteSource {
      src = fetchgit {
        name = "teleop_tools-source";
        url = "https://github.com/ros2-gbp/teleop_tools-release.git";
        rev = "bc93083aa08ff5c85ebec73b89c5fa6e52203eac";
        hash = "sha256-E30WTAih0i8SO+KhRI9nR/6HEWp3i0ZHR0XvfbBXg8Q=";
      };
    };
  });
  meta = {
    description = "A set of generic teleoperation tools for any robot.";
  };
})
