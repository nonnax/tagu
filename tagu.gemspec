Gem::Specification.new do |s|
  s.name = 'tagu'
  s.version = '0.0.1'
  s.date = 04/02/22
  s.summary = "a non magicical html builder"
  s.authors = ["xxanon"]
  s.email = "ironald@gmail.com"
  s.files = `git ls-files`.split("\n") - %w[bin misc]
  s.executables += `git ls-files bin`.split("\n").map{|e| File.basename(e)}
  s.homepage = "https://github.com/nonnax/tagu.git"
  s.license = "GPL-3.0"
end
