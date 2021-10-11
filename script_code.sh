HFN=$SRCROOT/$PROJECT_NAME/build_version.h
[[ -f $HFN ]] || echo "#define BUILD_VERSION 0" > $HFN
NEW_VERSION=$(expr $(awk 'NR<2 {print $3}' $HFN) + 1)
echo "#define BUILD_VERSION $NEW_VERSION" > $HFN
echo "#define BUILD_DATE \"$(date +"%m-%d-%Y")\"" >> $HFN
