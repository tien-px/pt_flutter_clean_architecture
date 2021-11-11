flutter pub run easy_localization:generate -S lib/assets/translations -f keys -o locale_keys.g.dart

function toCamelCase() {
  camel=$(echo $1 | awk 'BEGIN{FS="";RS="_";ORS=""} {$0=toupper(substr($0,1,1)) substr($0,2)} 1')
  echo $camel | awk '{ print tolower(substr($0, 1, 1)) substr($0, 2) }'
}

start="const _assetsImagePath = 'lib/assets/images';

class Images {\n"
end="}"
content=""

dir="./lib/assets/images"
for file in "$dir"/*; do
  file_name=$(toCamelCase ${file##*/})
  file_name_no_ext=${file_name%.*}
  templete="  static const $file_name_no_ext = '\$_assetsImagePath/${file##*/}';\n"
  content+=$templete
done
echo "$start$content$end" > ./lib/assets/images/images.dart
echo "All done! Asset files generated."
exit