FROM ruby:3.3
RUN gem update bundler
RUN gem install bundler jekyll
COPY <<-EOF /entrypoint.sh
set -euo pipefail
set -x
cd /site
bundle install
bundle exec jekyll serve --watch --host  0.0.0.0
EOF
ENTRYPOINT [ "bash", "/entrypoint.sh" ]