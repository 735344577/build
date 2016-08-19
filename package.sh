#脚本放到工程同目录下 然后下面工程名
#/bin/sh package.sh
#计时

SECONDS=0

#假设脚本放置在与项目相同的路径下

#project_path="$(pwd)/newItemForiOS/workspace"
project_path="$(pwd)"

#取当前时间字符串添加到文件结尾

now=$(date +"%Y_%m_%d_%H_%M_%S")

#指定项目的scheme名称

scheme="CloudMoney"

#指定要打包的配置名

configuration="Release"

#指定打包所使用的输出方式，目前支持app-store, package, ad-hoc, enterprise, development, 和developer-id，即xcodebuild的method参数

#export_method='development'
export_method='app-store'

#指定项目地址

workspace_path="$project_path/CloudMoney.xcworkspace"

#指定输出路径

mkdir "${HOME}/Desktop/CloudMoney_${now}"
output_path="${HOME}/Desktop/CloudMoney_${now}"

echo $output_path
#指定输出归档文件地址

archive_path="$output_path/CloudMoney_${now}.xcarchive"

#指定输出ipa地址

ipa_path="$output_path/CloudMoney_${now}.ipa"

#指定输出ipa名称

ipa_name="CloudMoney_${now}.ipa"

#获取执行命令时的commit message

commit_msg="$1"

#输出设定的变量值

echo "===workspace path: ${workspace_path}==="

echo "===archive path: ${archive_path}==="

echo "===ipa path: ${ipa_path}==="

echo "===export method: ${export_method}==="

echo "===commit msg: $1==="

#pod update
pod update --no-repo-update

#先清空前一次build

#gym --workspace ${workspace_path} --scheme ${scheme} --clean --configuration ${configuration} --archive_path ${archive_path} --export_method ${export_method} --output_directory ${output_path} --output_name ${ipa_name}
gym --workspace ${workspace_path} --scheme ${scheme} --clean --configuration ${configuration} --export_method ${export_method} --output_directory ${output_path} --output_name ${ipa_name}

#输出总用时

echo "===Finished. Total time: ${SECONDS}s==="

#打开包所在目录
open $output_path
