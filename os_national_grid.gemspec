# frozen_string_literal: true

require_relative "lib/os_national_grid/version"

Gem::Specification.new do |spec|
  spec.name = "os_national_grid"
  spec.version = OsNationalGrid::VERSION
  spec.authors = ["Unboxed Consulting"]
  spec.email = ["github@unboxedconsulting.com"]

  spec.summary = "Convert between Ordnance Survey National Grid and WGS84 coordinates."
  spec.description = "Transforms OS National Grid (OSGB36) to WGS84 coordinates using official Ordnance Survey methods."
  spec.homepage = "https://github.com/unboxed/os_national_grid"

  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.each_line("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
