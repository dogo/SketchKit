# Warn if PR is a Work in Progress and shouldn't be merged yet
warn("PR is classed as Work in Progress") if github.pr_title.include?("WIP")

# Warn if the PR is considered "big" (more than 150 lines of code changed)
warn("Big PR - #{git.lines_of_code} lines of code") if git.lines_of_code > 150

# Ensure testing shortcuts (fdescribe, fit) aren't accidentally merged into master
fail("fdescribe found in tests") if `grep -r fdescribe Tests/ `.length > 1
fail("fit found in tests") if `grep -r fit Tests/ `.length > 1

# Define a method to handle directory linting
def lint_directory(directory, config_file)
  Dir.chdir(directory) do
    swiftlint.config_file = config_file
    swiftlint.lint_files(fail_on_error: true)
  end
end

# Lint Sources directory
lint_directory('Sources', '.swiftlint.yml')

# Lint Tests directory
lint_directory('Tests', '.swiftlint.yml')
