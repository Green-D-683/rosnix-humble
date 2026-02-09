{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "shared_queues_vendor";
  version = "0.15.16-1";
  src = finalAttrs.passthru.sources."shared_queues_vendor";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "shared_queues_vendor" = substituteSource {
      src = fetchgit {
        name = "shared_queues_vendor-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "ecc02af574db985e1ebe866181c17fbef5ca20e9";
        hash = "sha256-rmV1AvO7SYLLYTA+SJh8VuyL20UJxoP52DeCkEVIdIw=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/cameron314/concurrentqueue/archive/8f65a8734d77c3cc00d74c0532efca872931d3ce.zip";
          to = "URL ${sources."shared_queues_vendor/8f65a8734d77c3cc00d74c0532efca872931d3ce"}";
        }
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/cameron314/readerwriterqueue/archive/ef7dfbf553288064347d51b8ac335f1ca489032a.zip";
          to = "URL ${sources."shared_queues_vendor/ef7dfbf553288064347d51b8ac335f1ca489032a"}";
        }
      ];
    };
    "shared_queues_vendor/8f65a8734d77c3cc00d74c0532efca872931d3ce" = substituteSource {
      src = fetchzip {
        name = "8f65a8734d77c3cc00d74c0532efca872931d3ce-source";
        url = "https://github.com/cameron314/concurrentqueue/archive/8f65a8734d77c3cc00d74c0532efca872931d3ce.zip";
        hash = "sha256-gX96jJteYLd/t2jvffx5lcpFETmGnBt6IW31dGBvR8c=";
      };
    };
    "shared_queues_vendor/ef7dfbf553288064347d51b8ac335f1ca489032a" = substituteSource {
      src = fetchzip {
        name = "ef7dfbf553288064347d51b8ac335f1ca489032a-source";
        url = "https://github.com/cameron314/readerwriterqueue/archive/ef7dfbf553288064347d51b8ac335f1ca489032a.zip";
        hash = "sha256-tfF1cjjiVn/Di2rYUS7TAqD4ojx7x0eRHVyn/GG/7+Q=";
      };
    };
  });
  meta = {
    description = "Vendor package for concurrent queues from moodycamel";
  };
})
