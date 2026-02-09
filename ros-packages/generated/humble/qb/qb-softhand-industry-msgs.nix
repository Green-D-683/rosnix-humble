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
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "qb_softhand_industry_msgs";
  version = "2.1.2-4";
  src = finalAttrs.passthru.sources."qb_softhand_industry_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "qb_softhand_industry_msgs" = substituteSource {
      src = fetchgit {
        name = "qb_softhand_industry_msgs-source";
        url = "https://bitbucket.org/qbrobotics/qbshin-ros2-release.git";
        rev = "e45e2fb47eb478c003c669bac3442b7dfbf9d3ad";
        hash = "sha256-IknmBLuGSGa0xZeNSAOKXqakU5+BUOxkzEf+yjI28WQ=";
      };
    };
  });
  meta = {
    description = "\n    This package contains the ROS messages for qbrobotics® SoftHand Industry.\n  ";
  };
})
