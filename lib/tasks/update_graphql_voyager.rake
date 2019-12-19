# frozen_string_literal: true

desc 'Vendor the latest GraphQL Voyager version'
task :update_graphql_voyager do
  require 'fileutils'
  require 'json'

  new_js_versions = {}
  new_css_versions = {}

  def replace_versions(path, new_versions)
    old_contents = File.read(path)
    new_contents = new_versions.reduce(old_contents) do |contents, (package, new_version)|
      contents.gsub(/#{package}-\d+\.\d+\.\d+.*$/, "#{package}-#{new_version}")
    end
    File.write(path, new_contents)
  end

  def npm_version(package_json_path)
    npm_config = JSON.parse(File.read(package_json_path))
    npm_config['version']
  end

  def npm_dev_dependency_version(package_json_path, package)
    npm_config = JSON.parse(File.read(package_json_path))
    npm_config['devDependencies'][package]
  end

  npm_install_path = './graphql_voyager_update'
  asset_js_path = File.expand_path('app/assets/javascripts/graphql/voyager/rails')
  asset_js_path_tmp = File.expand_path('app/assets/javascripts/graphql/voyager/rails_tmp')
  asset_css_path = File.expand_path('app/assets/stylesheets/graphql/voyager/rails')
  asset_css_path_tmp = File.expand_path('app/assets/stylesheets/graphql/voyager/rails_tmp')

  FileUtils.mkdir_p(npm_install_path)
  FileUtils.mkdir_p(asset_js_path_tmp)
  FileUtils.mkdir_p(asset_css_path_tmp)
  FileUtils.cp(File.join(asset_js_path, "application.js"), File.join(asset_js_path_tmp, "application.js"))
  FileUtils.cp(File.join(asset_js_path, "voyager.js"), File.join(asset_js_path_tmp, "voyager.js"))
  FileUtils.cp(File.join(asset_css_path, "application.css"), File.join(asset_css_path_tmp, "application.css"))

  FileUtils.cd(npm_install_path) do
    sh('npm init --force > /dev/null')
    sh('npm install graphql-voyager')

    react_version = nil
    react_dom_version = nil

    FileUtils.cd('./node_modules/graphql-voyager') do
      new_version = npm_version('./package.json')
      new_js_versions['voyager'] = new_version
      new_js_versions['voyager.worker'] = new_version
      new_css_versions["voyager"] = new_version

      react_version = npm_dev_dependency_version('./package.json', 'react')
      react_dom_version = npm_dev_dependency_version('./package.json', 'react-dom')

      puts "Copying GraphQL Voyager #{new_version}"
      FileUtils.cp('./dist/voyager.min.js', File.join(asset_js_path_tmp, "voyager-#{new_version}.js"))
      FileUtils.cp('./dist/voyager.worker.js', File.join(asset_js_path_tmp, "voyager.worker-#{new_version}.js"))
      FileUtils.cp('./dist/voyager.css', File.join(asset_css_path_tmp, "voyager-#{new_version}.css"))
    end

    sh("npm install react@#{react_version} react-dom@#{react_dom_version}")

    FileUtils.cd('./node_modules/react') do
      new_version = npm_version('./package.json')
      new_js_versions["react"] = new_version

      puts "Copying React #{new_version}"
      FileUtils.cp('./umd/react.production.min.js', File.join(asset_js_path_tmp, "react-#{new_version}.js"))
    end

    FileUtils.cd("./node_modules/react-dom") do
      new_version = npm_version('./package.json')
      new_js_versions["react-dom"] = new_version

      puts "Copying ReactDOM #{new_version}"
      FileUtils.cp('./umd/react-dom.production.min.js', File.join(asset_js_path_tmp, "react-dom-#{new_version}.js"))
    end

    FileUtils.cd("./node_modules/whatwg-fetch") do
      new_version = npm_version('./package.json')
      new_js_versions["fetch"] = new_version

      puts "Copying fetch #{new_version}"
      FileUtils.cp('./dist/fetch.umd.js', File.join(asset_js_path_tmp, "fetch-#{new_version}.js"))
    end
  end

  puts "Updating manifests"
  replace_versions(File.join(asset_js_path_tmp, "application.js"), new_js_versions)
  replace_versions(File.join(asset_js_path_tmp, "voyager.js"), new_js_versions)
  replace_versions(File.join(asset_css_path_tmp, "application.css"), new_css_versions)

  puts "Cutting over to new version"
  FileUtils.rm_rf(asset_js_path)
  FileUtils.rm_rf(asset_css_path)
  FileUtils.mv(asset_js_path_tmp, asset_js_path)
  FileUtils.mv(asset_css_path_tmp, asset_css_path)

  puts "Removing NPM install"
  FileUtils.rm_rf(npm_install_path)
end
