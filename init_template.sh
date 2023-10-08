
echo "Initializing template..."

echo "Installing dependencies..."
dart pub get

echo "Installing husky and activating pre-commit hook..."
dart run husky install
dart run husky set .husky/commit-msg 'dart run commitlint_cli --edit "$1"'


# add 'init_template.sh' to .vscode/settings.json file exclude list
echo "Adding 'init_template.sh' to .vscode/settings.json "files.exclude" map..."
sed -i '' 's/"files.exclude": {/"files.exclude": {\n\t"init_template.sh": true,/g' .vscode/settings.json

echo "Replacing README.md with flutter template README.md..."
echo "The templates README.md is now README_TEMPLATE.md (but hidden via .vscode/settings.json 'files.exclude' map)."
mv README.md README_TEMPLATE.md
mv README_FLUTTER.md README.md

echo ""
echo "Template initialized!"

