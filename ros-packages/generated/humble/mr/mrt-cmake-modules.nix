{
  ament-cmake-core,
  buildCatkinPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gtest-vendor,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildCatkinPackage (finalAttrs: {
  pname = "mrt_cmake_modules";
  version = "1.0.11-1";
  src = finalAttrs.passthru.sources."mrt_cmake_modules";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ gtest-vendor ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "lcov" "python3-catkin-pkg-modules" "python3-rospkg" "python3-setuptools" "python3-yaml" ]; };
  buildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ gtest-vendor ros-environment ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "lcov" "python3-catkin-pkg-modules" "python3-rospkg" "python3-setuptools" "python3-yaml" ]; };
  passthru.sources = mkSourceSet (sources: {
    "mrt_cmake_modules" = substituteSource {
      src = fetchgit {
        name = "mrt_cmake_modules-source";
        url = "https://github.com/ros2-gbp/mrt_cmake_modules-release.git";
        rev = "4447d48649764050a26333a783b1826bfd99ce49";
        hash = "sha256-P+/sA/qc4KidP4Kzg1VSvYisUOmLdM7Y7gvrVm87rp8=";
      };
    };
  });
  meta = {
    description = "CMake Functions and Modules for automating CMake";
  };
})
