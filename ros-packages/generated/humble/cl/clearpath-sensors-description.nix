{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  microstrain-inertial-description,
  mkSourceSet,
  realsense2-description,
  rosSystemPackages,
  substituteSource,
  velodyne-description,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "clearpath_sensors_description";
  version = "1.3.9-1";
  src = finalAttrs.passthru.sources."clearpath_sensors_description";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ microstrain-inertial-description realsense2-description velodyne-description ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ microstrain-inertial-description realsense2-description velodyne-description ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_sensors_description" = substituteSource {
      src = fetchgit {
        name = "clearpath_sensors_description-source";
        url = "https://github.com/clearpath-gbp/clearpath_common-release.git";
        rev = "6b93e5024d81a362d8f78d772a83aa98f80420c8";
        hash = "sha256-8oxgzk5p1k0WGtSKQsNZ1I7pJ111tsLvkSoQYMFjyMs=";
      };
    };
  });
  meta = {
    description = "Clearpath sensors URDF descriptions";
  };
})
