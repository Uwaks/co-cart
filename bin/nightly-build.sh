#!/bin/sh

# Output colorized strings
#
# Color codes:
# 0 - black
# 1 - red
# 2 - green
# 3 - yellow
# 4 - blue
# 5 - magenta
# 6 - cian
# 7 - white
output() {
	echo "$(tput -T xterm setaf "$1")$2$(tput -T xterm sgr0)"
}

PLUGIN_SLUG="cocart"
PROJECT_PATH=$(pwd)
BUILD_PATH="${PROJECT_PATH}/plugins"
DEST_PATH="$BUILD_PATH/$PLUGIN_SLUG"

composer install

output 3 "Cleaning up packages..."

#rsync -rc --exclude-from="$DEST_PATH/.distignore" "$PROJECT_PATH/" "$DEST_PATH/" --delete --delete-excluded

find "$DEST_PATH"/packages -name ".distignore" -type f -delete
find "$DEST_PATH"/packages -name ".editorconfig" -type f -delete
find "$DEST_PATH"/packages -name ".gitattributes" -type f -delete
find "$DEST_PATH"/packages -name ".gitignore" -type f -delete
find "$DEST_PATH"/packages -name ".stylelintrc" -type f -delete
find "$DEST_PATH"/packages -name ".stylelintignore" -type f -delete
find "$DEST_PATH"/packages -name "Gruntfile.js" -type f -delete
find "$DEST_PATH"/packages -name "package.json" -type f -delete
find "$DEST_PATH"/packages -name "package-lock.json" -type f -delete
find "$DEST_PATH"/packages -name "phpcs.xml" -type f -delete
find "$DEST_PATH"/packages -name "phpunit.xml" -type f -delete
find "$DEST_PATH"/packages -name "composer.json" -type f -delete
find "$DEST_PATH"/packages -name "composer.lock" -type f -delete
find "$DEST_PATH"/packages -name "renovate.json" -type f -delete
find "$DEST_PATH"/packages -name "src" -type d -exec rm -rf {} +
find "$DEST_PATH"/packages -name "languages" -type d -exec rm -rf {} +
find "$DEST_PATH"/packages -name "LICENSE.*" -type f -delete
find "$DEST_PATH"/packages -name "license.*" -type f -delete
find "$DEST_PATH"/packages -name "README.md" -type f -delete
find "$DEST_PATH"/packages -name "readme.txt" -type f -delete
find "$DEST_PATH"/packages -name "uninstall.php" -type f -delete
find "$DEST_PATH" -name ".github" -type d -exec rm -rf {} +
find "$DEST_PATH" -name ".git" -type d -exec rm -rf {} +
find "$DEST_PATH" -name "README.md" -type f -delete

output 2 "Package cleaning complete!"

output 3 "Updating autoloader classmaps..."
cd "$DEST_PATH"
composer install
composer dump-autoload
output 2 "Autoloader classmap ready!"

# Remove remaining files
find "$DEST_PATH" -name ".distignore" -type f -delete
find "$DEST_PATH" -name ".gitignore" -type f -delete
find "$DEST_PATH" -name "composer.json" -type f -delete

cd -

output 3 "Generating zip file..."
cd "$BUILD_PATH" || exit
zip -q -r "${PLUGIN_SLUG}.zip" "$PLUGIN_SLUG/" || output 5 "Unable to generate zip file!" exit

cd "$PROJECT_PATH" || exit
output 3 "${PLUGIN_SLUG}.zip file generated!"

output 2 "Build done!"