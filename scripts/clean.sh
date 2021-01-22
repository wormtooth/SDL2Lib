rm -fr $PROD_DIR
cd $TMP_DIR
for folder in `ls -d */`; do
	rm -fr $folder
done
